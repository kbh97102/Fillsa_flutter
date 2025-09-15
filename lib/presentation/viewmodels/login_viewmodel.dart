import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fillsa_flutter/domain/model/request/device_data.dart';
import 'package:fillsa_flutter/domain/model/request/login_data.dart';
import 'package:fillsa_flutter/domain/model/request/login_request.dart';
import 'package:fillsa_flutter/domain/model/request/user_data.dart';
import 'package:fillsa_flutter/domain/usecase/login_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_access_token_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_refresh_token_usecase.dart';
import 'package:fillsa_flutter/presentation/util/logger.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/model/response/login_response.dart';
import '../ui/login/login_result.dart';

@injectable
class LoginViewModel extends AsyncNotifier<LoginResult> {
  final LoginUseCase loginUseCase;
  final SetAccessTokenUseCase setAccessTokenUseCase;
  final SetRefreshTokenUseCase setRefreshTokenUseCase;

  LoginViewModel(
    this.setAccessTokenUseCase,
    this.setRefreshTokenUseCase, {
    required this.loginUseCase,
  });

  @override
  FutureOr<LoginResult> build() {
    return LoginInitial();
  }

  Future<void> signInWithGoogle() async {
    state = AsyncValue.loading();

    final GoogleSignIn signIn = GoogleSignIn.instance;

    final clientId = dotenv.env['CLIENT_ID'];
    final serverClientId = dotenv.env['SERVER_CLIENT_ID'];

    unawaited(
      signIn
          .initialize(clientId: clientId, serverClientId: serverClientId)
          .then((_) {
            signIn.authenticationEvents
                .listen(_handleAuthenticationEvent)
                .onError(_handleAuthenticationError);

            signIn.attemptLightweightAuthentication();
          }),
    );
  }

  void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) async {
    // 이벤트가 성공적인 인증을 나타내는 'GoogleSignInAuthenticated' 타입인지 확인합니다.

    if (event is GoogleSignInAuthenticationEventSignIn) {
      // 성공 이벤트 내부에 있는 authentication 객체에 접근합니다.
      logger.d("${event.user}");
      final account = event.user;

      final (id, nickName, profileImageUri) = _getLoginUserData(
        account.authentication.idToken,
      );

      _postLogin(id: id, nickName: nickName, profileImageUri: profileImageUri);
    }
  }

  void _postLogin({
    required String? id,
    required String? nickName,
    required String? profileImageUri,
  }) async {
    final fid = await FirebaseInstallations.instance.getId();
    final platformInfo = await PackageInfo.fromPlatform();

    // TODO: 로컬데이터 sync 맞추기

    final loginRequest = LoginRequest(
      loginData: LoginData(
        deviceData: DeviceData(
          deviceId: fid,
          osType: "ANDROID",
          appVersion: _getOsType(),
          osVersion: platformInfo.version,
          deviceModel: platformInfo.buildNumber,
        ),
        userData: UserData(
          oAuthProvider: "GOOGLE",
          oAuthId: id ?? "",
          nickname: nickName ?? "",
          profileImageUrl: profileImageUri ?? "",
        ),
      ),
      syncData: List.empty(),
    );

    final LoginResponse loginResponse = await loginUseCase.call(loginRequest);

    _saveLoginResponse(loginResponse);

    state = AsyncData(LoginSuccess());
  }

  _saveLoginResponse(LoginResponse loginResponse) {
    setAccessTokenUseCase.call(loginResponse.accessToken);
    setRefreshTokenUseCase.call(loginResponse.refreshToken);
    // TODO: 로컬 데이터 제거
  }

  (String, String, String) _getLoginUserData(String? idToken) {
    try {
      // 1. idToken이 null이거나 비어있는지 확인합니다.
      if (idToken == null || idToken.isEmpty) {
        return ('', '', '');
      }

      // 2. JWT는 세 부분(Header.Payload.Signature)으로 구성되므로 '.'을 기준으로 분리합니다.
      final parts = idToken.split('.');
      if (parts.length != 3) {
        // JWT 형식이 아니면 빈 값을 반환합니다.
        return ('', '', '');
      }

      // 3. 두 번째 부분인 페이로드(Payload)를 추출합니다.
      final payload = parts[1];

      // 4. 페이로드를 Base64Url 형식으로 디코딩합니다.
      // JWT의 Base64는 URL-safe이며 패딩이 없는 경우가 많으므로,
      // normalize 함수로 패딩을 복원한 후 디코딩해야 안전합니다.
      final String decodedString = utf8.decode(
        base64Url.decode(base64Url.normalize(payload)),
      );

      // 5. 디코딩된 문자열을 JSON 객체로 파싱합니다.
      final Map<String, dynamic> userData = jsonDecode(decodedString);

      // 6. JSON 객체에서 필요한 사용자 정보를 추출합니다.
      // 코틀린의 optString처럼, 키가 없으면 null이 되므로 ?? '' 로 기본값을 지정합니다.
      final String id = userData['sub']?.toString() ?? '';
      final String name = userData['name']?.toString() ?? '';
      final String image = userData['picture']?.toString() ?? '';

      return (id, name, image);
    } catch (e) {
      // 디코딩 또는 파싱 과정에서 오류 발생 시 빈 값을 반환합니다.
      print('ID 토큰 처리 중 오류 발생: $e');
      return ('', '', '');
    }
  }

  void _handleAuthenticationError(Object error, StackTrace stackTrace) {
    logger.e('인증 스트림에서 예외적인 에러 발생: $error');
    logger.e('stackTrace: ${stackTrace}');
  }

  String _getOsType() {
    if (Platform.isAndroid) {
      return "ANDROID";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      // 웹, 데스크톱 등 다른 플랫폼에 대한 처리
      return "UNKNOWN";
    }
  }
}
