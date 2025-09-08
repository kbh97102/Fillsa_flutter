import '../model/local_quote_info.dart';
import '../model/yn.dart';

abstract class LocalRepository {
  Future<void> setAccessToken(String token);

  Future<String?> getAccessToken();

  Future<void> setRefreshToken(String token);

  Future<String?> getRefreshToken();

  Future<void> setImageUri(String uri);

  Future<void> setShareDescriptionVisible(bool boolean);

  Future<bool?> getShareDescriptionVisible();

  Future<String?> getImageUri();

  Stream<bool?> getLoginStatus();

  Future<bool?> isFirstOpen();

  Future<void> setFirstOpen(bool value);

  Future<void> setAlarm(bool value);

  Future<void> setName(String value);

  Future<bool?> getAlarm();

  Future<String?> getName();

  Future<bool?> isAlarmPermissionRequestedBefore();

  Future<void> setAlarmPermissionRequestedBefore(bool requested);

  Future<List<LocalQuoteInfo>> getLocalQuotes();

  Future<void> addLocalQuote(LocalQuoteInfo quote);

  // 파라미터가 2개 이상일 경우, Dart에서는 named parameter 사용이 권장됩니다.
  Future<void> deleteQuoteByObject(LocalQuoteInfo quote);

  Future<void> updateQuote(LocalQuoteInfo quote);

  // PagingData<T>에 대한 변환 (자세한 설명은 아래 참조)
  // 일반적으로 페이지 번호와 사이즈를 받아 해당 페이지의 리스트를 Future로 반환합니다.
  Future<List<LocalQuoteInfo>> getLocalQuotesPaging({
    required YN likeYN,
    required String startDate,
    required String endDate,
    required int page, // 페이지 번호
    required int size, // 페이지 당 아이템 수
  });

  Future<void> updateLocalQuoteMemo({required String memo, required int seq});

  Future<int?> updateLocalQuoteLike({required YN likeYN, required int seq});

  Future<LocalQuoteInfo?> getQuoteLocal(int seq);

  Future<String?> getTokenExpired();

  Future<LocalQuoteInfo?> findLocalQuoteById(int seq);

  Future<void> clear();

  Future<void> deleteQuoteBySeq(int seq);
}
