import 'dart:async';

import 'package:fillsa_flutter/data/local/local_database.dart';
import 'package:fillsa_flutter/data/util/PrefKey.dart';
import 'package:fillsa_flutter/data/util/extension.dart';
import 'package:fillsa_flutter/domain/model/local_quote_info.dart';
import 'package:fillsa_flutter/domain/model/yn.dart';
import 'package:fillsa_flutter/domain/repository/local_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_transform/stream_transform.dart';

@LazySingleton(as: LocalRepository)
class LocalRepositoryImpl extends LocalRepository {
  final SharedPreferencesAsync prefs;
  final LocalDatabase localQuoteInfoDao;
  final _loginStatusController = StreamController<bool>.broadcast();
  late final _loginStatusStream = _loginStatusController.stream;

  final _test = BehaviorSubject<bool>();
  late final _testStream = _test.stream;

  LocalRepositoryImpl({required this.prefs, required this.localQuoteInfoDao});

  @override
  Future<void> addLocalQuote(LocalQuoteInfo quote) async {
    localQuoteInfoDao.insertQuote(quote.toEntity());
  }

  @override
  Future<void> clear() async {
    await localQuoteInfoDao.clear();
  }

  @override
  Future<void> logout() async {
    await localQuoteInfoDao.clear();
    await prefs.remove(PrefKey.accessToken);
    await prefs.remove(PrefKey.refreshToken);
    await prefs.remove(PrefKey.userName);
    await prefs.remove(PrefKey.imageUri);
    await _updateLoginStatus();
  }

  @override
  Future<void> deleteQuoteByObject(LocalQuoteInfo quote) async {
    localQuoteInfoDao.deleteQuote(quote);
  }

  @override
  Future<void> deleteQuoteBySeq(int seq) async {
    localQuoteInfoDao.deleteQuoteById(seq);
  }

  @override
  Future<LocalQuoteInfo?> findLocalQuoteById(int seq) =>
      localQuoteInfoDao.findQuoteById(seq).then((entity) => entity?.toModel());

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
  Future<List<LocalQuoteInfo>> getLocalQuotes() async {
    final list = await localQuoteInfoDao.getAllQuotes();
    return list.map((entity) => entity.toModel()).toList();
  }

  @override
  Future<List<LocalQuoteInfo>> getLocalQuotesPaging({
    required YN likeYN,
    required String startDate,
    required String endDate,
    required int page,
    required int size,
  }) async {
    final offset = page * size;
    final List<LocalQuoteInfoEntityData> entities;
    if (likeYN == YN.Y) {
      entities = await localQuoteInfoDao.getPagingListWithLike(
        offset,
        likeYN.name,
        startDate,
        endDate,
      );
    } else {
      entities = await localQuoteInfoDao.getPagingList(offset, startDate, endDate);
    }
    return entities.map((e) => e.toModel()).toList();
  }

  Future<void> _updateLoginStatus() async {
    final accessToken = await prefs.getString(PrefKey.accessToken);
    final refreshToken = await prefs.getString(PrefKey.refreshToken);

    final isLogged =
        ((accessToken != null && accessToken.isNotEmpty) &&
        (refreshToken != null && refreshToken.isNotEmpty));

    _loginStatusController.add(isLogged);
    _test.add(isLogged);
  }

  Future<bool> _getLogin() async {
    final accessToken = await prefs.getString(PrefKey.accessToken);
    final refreshToken = await prefs.getString(PrefKey.refreshToken);

    return ((accessToken != null && accessToken.isNotEmpty) &&
        (refreshToken != null && refreshToken.isNotEmpty));
  }

  @override
  Stream<bool> getLoginStatus() {
    final initStream = Stream.fromFuture(_getLogin());

    return _test.startWithStream(initStream);
  }

  @override
  Future<String?> getName() {
    return prefs.getString(PrefKey.userName);
  }

  @override
  Future<LocalQuoteInfo?> getQuoteLocal(int seq) =>
      localQuoteInfoDao.getQuote(seq).then((entity) => entity?.toModel());

  @override
  Future<String?> getRefreshToken() {
    return prefs.getString(PrefKey.refreshToken);
  }

  @override
  Future<bool?> getShareDescriptionVisible() {
    return prefs.getBool(PrefKey.shareDescription);
  }

  @override
  Future<String?> getTokenExpired() {
    return prefs.getString(PrefKey.tokenExpired);
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
    await prefs.setString(PrefKey.accessToken, token);
    await _updateLoginStatus();
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
  Future<void> setFirstOpen(bool value) async {
    prefs.setBool(PrefKey.firstOpenKey, value);
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
    await prefs.setString(PrefKey.refreshToken, token);
    await _updateLoginStatus();
  }

  @override
  Future<void> setShareDescriptionVisible(bool boolean) async {
    prefs.setBool(PrefKey.shareDescription, boolean);
  }

  @override
  Future<int?> updateLocalQuoteLike({
    required YN likeYN,
    required int seq,
  }) async {
    if (likeYN == YN.N) {
      final entity = await localQuoteInfoDao.findQuoteById(seq);
      if (entity != null &&
          entity.korTyping.isEmpty &&
          entity.engTyping.isEmpty) {
        localQuoteInfoDao.deleteQuoteById(seq);
        return 0;
      }
    }

    return localQuoteInfoDao.updateLike(likeYN.name, seq);
  }

  @override
  Future<void> updateLocalQuoteMemo({
    required String memo,
    required int seq,
  }) async {
    localQuoteInfoDao.updateMemo(memo, seq);
  }

  @override
  Future<void> updateQuote(LocalQuoteInfo quote) async {
    localQuoteInfoDao.updateQuote(quote);
  }

  @override
  Future<String?> getThemeMode() {
    return prefs.getString(PrefKey.themeMode);
  }

  @override
  Future<void> setThemeMode(String value) async {
    await prefs.setString(PrefKey.themeMode, value);
  }
}
