// 생성된 파일을 import 합니다. 파일명은 {현재_파일명}.config.dart 입니다.
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // 생성될 초기화 함수의 이름
  preferRelativeImports: true, // 상대 경로 사용 여부
  asExtension: false, // getIt 확장 함수 생성 여부
)
void configureDependencies() => init(getIt);
