import 'package:fillsa_flutter/data/util/PrefKey.dart';
import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LocalRepository)
class LocalRepositoryImpl extends LocalRepository {
  final SharedPreferencesAsync prefs;

  LocalRepositoryImpl({required this.prefs});

  @override
  Future<void> addLocalQuote(LocalQuoteInfo quote) async {
    // TODO: implement addLocalQuote
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> deleteQuoteByObject(LocalQuoteInfo quote) {
    // TODO: implement deleteQuoteByObject
    throw UnimplementedError();
  }

  @override
  Future<void> deleteQuoteBySeq(int seq) {
    // TODO: implement deleteQuoteBySeq
    throw UnimplementedError();
  }

  @override
  Future<LocalQuoteInfo?> findLocalQuoteById(int seq) {
    // TODO: implement findLocalQuoteById
    throw UnimplementedError();
  }

  @override
  Future<String?> getAccessToken() {
    return prefs.getString(PrefKey.accessToken);
  }

  @override
  Future<bool?> getAlarm() {
    return prefs.getBool(PrefKey.alarmKey);
  }

  @override
  Future<String?> getImageUri() {
    return prefs.getString(PrefKey.imageUri);
  }

  @override
  Future<List<LocalQuoteInfo>> getLocalQuotes() {
    // TODO: implement getLocalQuotes
    throw UnimplementedError();
  }

  @override
  Future<List<LocalQuoteInfo>> getLocalQuotesPaging({
    required YN likeYN,
    required String startDate,
    required String endDate,
    required int page,
    required int size,
  }) {
    // TODO: implement getLocalQuotesPaging
    throw UnimplementedError();
  }

  @override
  Future<bool> getLoginStatus() {
    // TODO: implement getLoginStatus
    throw UnimplementedError();
  }

  @override
  Future<String?> getName() {
    return prefs.getString(PrefKey.userName);
  }

  @override
  Future<LocalQuoteInfo?> getQuoteLocal(int seq) {
    // TODO: implement getQuoteLocal
    throw UnimplementedError();
  }

  @override
  Future<String?> getRefreshToken() {
    return prefs.getString(PrefKey.refreshToken);
  }

  @override
  Future<bool?> getShareDescriptionVisible() {
    return prefs.getBool(PrefKey.shareDescription);
  }

  @override
  Future<String> getTokenExpired() {
    // TODO: implement getTokenExpired
    throw UnimplementedError();
  }

  @override
  Future<bool?> isAlarmPermissionRequestedBefore() {
    return prefs.getBool(PrefKey.shareDescription);
  }

  @override
  Future<bool?> isFirstOpen() {
    return prefs.getBool(PrefKey.firstOpenKey);
  }

  @override
  Future<void> setAccessToken(String token) async {
    prefs.setString(PrefKey.accessToken, token);
  }

  @override
  Future<void> setAlarm(bool value) async {
    prefs.setBool(PrefKey.alarmKey, value);
  }

  @override
  Future<void> setAlarmPermissionRequestedBefore(bool requested) async {
    prefs.setBool(PrefKey.permissionRequested, requested);
  }

  @override
  Future<void> setFirstOpen(bool value) {
    // TODO: implement setFirstOpen
    throw UnimplementedError();
  }

  @override
  Future<void> setImageUri(String uri) async {
    prefs.setString(PrefKey.imageUri, uri);
  }

  @override
  Future<void> setName(String value) async {
    prefs.setString(PrefKey.userName, value);
  }

  @override
  Future<void> setRefreshToken(String token) async {
    prefs.setString(PrefKey.refreshToken, token);
  }

  @override
  Future<void> setShareDescriptionVisible(bool boolean) async {
    prefs.setBool(PrefKey.shareDescription, boolean);
  }

  @override
  Future<int> updateLocalQuoteLike({required YN likeYN, required int seq}) {
    // TODO: implement updateLocalQuoteLike
    throw UnimplementedError();
  }

  @override
  Future<void> updateLocalQuoteMemo({required String memo, required int seq}) {
    // TODO: implement updateLocalQuoteMemo
    throw UnimplementedError();
  }

  @override
  Future<void> updateQuote(LocalQuoteInfo quote) {
    // TODO: implement updateQuote
    throw UnimplementedError();
  }
}
