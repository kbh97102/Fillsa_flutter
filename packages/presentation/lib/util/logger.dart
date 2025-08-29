import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1, // 스택 트레이스에서 보여줄 메서드 개수
    errorMethodCount: 5, // 에러 발생 시 보여줄 메서드 개수
    lineLength: 80, // 로그 한 줄의 길이
    colors: true, // 색상 사용 여부
    printEmojis: true, // 이모티콘 사용 여부
    printTime: true, // 시간 출력 여부
  ),
);
