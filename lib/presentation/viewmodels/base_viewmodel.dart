import 'dart:async';

import 'package:fillsa_flutter/domain/model/api_result.dart';

/*
TODO
 * 뷰모델에서 만 with로 사용이 가능하도록 하고싶음, on 이라는 키워드를 통해 가능은 하지만
 * asyncNotifier, Notifier의 공통 부모가 없는게 문제
 * 그럼 ViewModel이란 이름으로 abstract class 만들어서 상속받고 mixin on ViewModel 같이 하는 방법도 있긴한데
 * 오버헤드가 생기긴함 접근성 관리와 오버헤드간의 트레이드 오프를 어디까지 해야할까?
 *
 */
mixin class BaseViewModel {
  StreamController<String> _errorController = StreamController();
  Stream<String> get error => _errorController.stream; // Dart의 getter

  Future<T?> getResponse<T>(Future<ApiResult<T>> Function() call) async {
    final apiResult = await call();

    return switch (apiResult) {
      Success(data: final data) => data,

      Fail(error: final error) =>
        () {
          _errorController.add(error.message);
          return null;
        } // 여기까지가 이제 익명함수 생성부
        (), // 이 부분은 앞에 만든 익명함수르 바로 실행하는 의미
    };
  }

  void emitError(String message) => _errorController.add(message);

  onDispose() {
    _errorController.close();
  }
}
