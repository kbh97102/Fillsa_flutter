import 'dart:async';

import 'package:fillsa_flutter/presentation/util/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  final GoogleSignIn signIn = GoogleSignIn.instance;
  unawaited(
    signIn
        .initialize(clientId: "clientId", serverClientId: "serverClientId")
        .then((_) {
          signIn.authenticationEvents
              .listen(_handleAuthenticationEvent)
              .onError(_handleAuthenticationError);

          /// This example always uses the stream-based approach to determining
          /// which UI state to show, rather than using the future returned here,
          /// if any, to conditionally skip directly to the signed-in state.
          signIn.attemptLightweightAuthentication();
        }),
  );
}

void _handleAuthenticationEvent(GoogleSignInAuthenticationEvent event) {
  print('새로운 인증 이벤트를 받았습니다: $event');

  // 이벤트가 성공적인 인증을 나타내는 'GoogleSignInAuthenticated' 타입인지 확인합니다.
  if (event is GoogleSignInAuthenticationEventSignIn) {
    // 성공 이벤트 내부에 있는 authentication 객체에 접근합니다.
    logger.d("${event.user}");
  }
}

void _handleAuthenticationError(Object error, StackTrace stackTrace) {
  logger.e('인증 스트림에서 예외적인 에러 발생: $error');
  logger.e('stackTrace: ${stackTrace}');

}