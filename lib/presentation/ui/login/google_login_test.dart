import 'dart:async';
import 'dart:convert';

import 'package:fillsa_flutter/presentation/util/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  final GoogleSignIn signIn = GoogleSignIn.instance;

  final clientId = dotenv.env['CLIENT_ID'];
  final serverClientId = dotenv.env['SERVER_CLIENT_ID'];

  unawaited(
    signIn.initialize(clientId: clientId, serverClientId: serverClientId).then((
      _,
    ) {
      signIn.authenticationEvents
          .listen(_handleAuthenticationEvent)
          .onError(_handleAuthenticationError);

      signIn.attemptLightweightAuthentication();
    }),
  );
}

Future<void> signInWithGoogle2() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
      .authenticate();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth?.idToken,
  );

  final test = await FirebaseAuth.instance.signInWithCredential(credential);
  logger.d("test $test");
}

void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) async {
  // 이벤트가 성공적인 인증을 나타내는 'GoogleSignInAuthenticated' 타입인지 확인합니다.

  if (event is GoogleSignInAuthenticationEventSignIn) {
    // 성공 이벤트 내부에 있는 authentication 객체에 접근합니다.
    logger.d("${event.user}");
    final account = event.user;

    final data = getLoginUserData(account.authentication.idToken);
    logger.d("data $data");
  }
}

(String, String, String) getLoginUserData(String? idToken) {
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
