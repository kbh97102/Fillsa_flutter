import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fillsa_flutter/domain/model/request/daily_sync_data.dart';
import 'package:fillsa_flutter/domain/model/request/device_data.dart';
import 'package:fillsa_flutter/domain/model/request/like_request.dart';
import 'package:fillsa_flutter/domain/model/request/login_data.dart';
import 'package:fillsa_flutter/domain/model/request/login_request.dart';
import 'package:fillsa_flutter/domain/model/request/memo_request.dart';
import 'package:fillsa_flutter/domain/model/request/typing_quote_request.dart';
import 'package:fillsa_flutter/domain/model/request/user_data.dart';
import 'package:fillsa_flutter/domain/usecase/clear_all_data_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/get_local_quotes_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/login_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_access_token_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/set_refresh_token_usecase.dart';
import 'package:fillsa_flutter/domain/usecase/test_error_code_usecase.dart';
import 'package:fillsa_flutter/presentation/util/logger.dart';
import 'package:fillsa_flutter/presentation/viewmodels/base_viewmodel.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/model/response/login_response.dart';
import '../ui/login/login_result.dart';

@injectable
class LoginViewModel extends AsyncNotifier<LoginResult> with BaseViewModel {
  final LoginUseCase loginUseCase;
  final SetAccessTokenUseCase setAccessTokenUseCase;
  final SetRefreshTokenUseCase setRefreshTokenUseCase;
  final GetLocalQuotesUseCase getLocalQuotesUseCase;
  final ClearAllDataUseCase clearAllDataUseCase;
  final TestErrorCodeUsecase testErrorCodeUsecase;

  LoginViewModel(
    this.setAccessTokenUseCase,
    this.setRefreshTokenUseCase,
    this.getLocalQuotesUseCase,
    this.clearAllDataUseCase,
    this.testErrorCodeUsecase, {
    required this.loginUseCase,
  });

  bool _googleInitialized = false;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSub;

  @override
  FutureOr<LoginResult> build() {
    ref.onDispose(() => _authSub?.cancel());
    return LoginInitial();
  }

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    _googleInitialized = true;

    final rawClientId = dotenv.maybeGet('CLIENT_ID') ?? '';
    final rawServerClientId = dotenv.maybeGet('SERVER_CLIENT_ID') ?? '';
    final clientId = rawClientId.isEmpty ? null : rawClientId;
    final serverClientId = rawServerClientId.isEmpty ? null : rawServerClientId;

    await GoogleSignIn.instance.initialize(
      clientId: clientId,
      serverClientId: serverClientId,
    );
    _authSub = GoogleSignIn.instance.authenticationEvents.listen(
      _handleAuthenticationEvent,
      onError: _handleAuthenticationError,
    );
  }

  Future<void> signInWithKakao() async {
    state = const AsyncValue.loading();
    try {
      if (await isKakaoTalkInstalled()) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          if (e is KakaoClientException && e.reason == ClientErrorCause.cancelled) {
            rethrow;
          }
          await UserApi.instance.loginWithKakaoAccount();
        }
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      final user = await UserApi.instance.me();
      await _postLogin(
        id: user.id.toString(),
        nickName: user.kakaoAccount?.profile?.nickname,
        profileImageUri: user.kakaoAccount?.profile?.profileImageUrl,
        oAuthProvider: "KAKAO",
      );
    } catch (e, st) {
      if (e is KakaoClientException && e.reason == ClientErrorCause.cancelled) {
        state = AsyncData(LoginInitial());
      } else {
        logger.e('카카오 로그인 실패: $e');
        state = AsyncError(e, st);
      }
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      await _ensureGoogleInitialized();
      await GoogleSignIn.instance.authenticate();
    } catch (e, st) {
      logger.e('구글 로그인 실패: $e');
      state = AsyncError(e, st);
    }
  }

  void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) async {
    if (event is GoogleSignInAuthenticationEventSignIn) {
      logger.d("${event.user}");
      final account = event.user;

      final (id, nickName, profileImageUri) = _getLoginUserData(
        account.authentication.idToken,
      );

      _postLogin(id: id, nickName: nickName, profileImageUri: profileImageUri, oAuthProvider: "GOOGLE");
    }
  }

  Future<void> _postLogin({
    required String? id,
    required String? nickName,
    required String? profileImageUri,
    required String oAuthProvider,
  }) async {
    final fid = await FirebaseInstallations.instance.getId();
    final platformInfo = await PackageInfo.fromPlatform();

    final localData = await getLocalQuotesUseCase.call();
    final localSyncDataList = localData
        .map(
          (local) => DailySyncData(
            dailyQuoteSeq: local.dailyQuoteSeq,
            typingQuoteRequest: TypingQuoteRequest(
              typingKorQuote: local.korTyping,
              typingEngQuote: local.engTyping,
            ),
            memoRequest: MemoRequest(memo: local.memo),
            likeRequest: LikeRequest(likeYn: local.likeYn),
          ),
        )
        .toList();

    final loginRequest = LoginRequest(
      loginData: LoginData(
        deviceData: DeviceData(
          deviceId: fid,
          osType: _getOsType(),
          appVersion: platformInfo.buildNumber,
          osVersion: platformInfo.version,
          deviceModel: platformInfo.buildNumber,
        ),
        userData: UserData(
          oAuthProvider: oAuthProvider,
          oAuthId: id ?? "",
          nickname: nickName ?? "",
          profileImageUrl: profileImageUri ?? "",
        ),
      ),
      syncData: localSyncDataList,
    );

    final loginResponse = await getResponse(
      () => loginUseCase.call(loginRequest),
    );

    if (loginResponse == null) {
      throw Exception('로그인에 실패했습니다. 다시 시도해주세요.');
    }

    await _saveLoginResponse(loginResponse);
    state = AsyncData(LoginSuccess());
  }

  Future<void> _saveLoginResponse(LoginResponse loginResponse) async {
    await setAccessTokenUseCase.call(loginResponse.accessToken);
    await setRefreshTokenUseCase.call(loginResponse.refreshToken);
    await clearAllDataUseCase.call();
  }

  (String, String, String) _getLoginUserData(String? idToken) {
    try {
      if (idToken == null || idToken.isEmpty) {
        return ('', '', '');
      }

      final parts = idToken.split('.');
      if (parts.length != 3) {
        return ('', '', '');
      }

      final payload = parts[1];
      final String decodedString = utf8.decode(
        base64Url.decode(base64Url.normalize(payload)),
      );

      final Map<String, dynamic> userData = jsonDecode(decodedString);

      final String id = userData['sub']?.toString() ?? '';
      final String name = userData['name']?.toString() ?? '';
      final String image = userData['picture']?.toString() ?? '';

      return (id, name, image);
    } catch (e) {
      logger.e('ID 토큰 처리 중 오류 발생: $e');
      return ('', '', '');
    }
  }

  void _handleAuthenticationError(Object error, StackTrace stackTrace) {
    logger.e('인증 스트림에서 예외적인 에러 발생: $error');
    state = AsyncError(error, stackTrace);
  }

  String _getOsType() {
    if (Platform.isAndroid) {
      return "ANDROID";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      return "UNKNOWN";
    }
  }
}
