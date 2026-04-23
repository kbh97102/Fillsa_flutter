import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:fillsa_flutter/data/util/extension.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/model/local_quote_info.dart';
import 'local_quote_info_entity.dart';
import 'streak_info_entity.dart';

part 'local_database.g.dart';

@injectable
@DriftDatabase(tables: [LocalQuoteInfoEntity, StreakInfoEntity])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(streakInfoEntity);
      }
    },
  );

  // 모든 반환 타입을 Model(LocalQuoteInfoEntity)로 변환
  Future<List<LocalQuoteInfoEntityData>> getAllQuotes() =>
      (select(localQuoteInfoEntity)..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
          ]))
          .get();

  Future<LocalQuoteInfoEntityData?> findQuoteById(int seq) => (select(
    localQuoteInfoEntity,
  )..where((t) => t.dailyQuoteSeq.equals(seq))).getSingleOrNull();

  Future<void> insertQuote(LocalQuoteInfoEntityCompanion quote) async {
    await into(localQuoteInfoEntity).insert(quote, mode: InsertMode.replace);
  }

  Future<void> deleteQuote(LocalQuoteInfo quote) async {
    await delete(localQuoteInfoEntity).delete(quote.toEntity());
  }

  Future<void> deleteQuoteById(int seq) async {
    await (delete(
      localQuoteInfoEntity,
    )..where((t) => t.dailyQuoteSeq.equals(seq))).go();
  }

  Future<void> updateQuote(LocalQuoteInfo quote) async {
    await update(localQuoteInfoEntity).replace(quote.toEntity());
  }

  Future<List<LocalQuoteInfoEntityData>> getPagingList(
    int offset,
    String startDate,
    String endDate,
  ) =>
      (select(localQuoteInfoEntity)
            ..where((t) => t.date.isBetweenValues(startDate, endDate))
            ..orderBy([
              (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
            ])
            ..limit(10, offset: offset))
          .get();

  Future<List<LocalQuoteInfoEntityData>> getPagingListWithLike(
    int offset,
    String likeYn,
    String startDate,
    String endDate,
  ) =>
      (select(localQuoteInfoEntity)
            ..where(
              (t) =>
                  t.likeYn.equals(likeYn) &
                  t.date.isBetweenValues(startDate, endDate),
            )
            ..orderBy([
              (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
            ])
            ..limit(10, offset: offset))
          .get();

  Future<void> updateMemo(String memo, int seq) async {
    await (update(localQuoteInfoEntity)
          ..where((t) => t.dailyQuoteSeq.equals(seq)))
        .write(LocalQuoteInfoEntityCompanion(memo: Value(memo)));
  }

  Future<int> updateLike(String likeYn, int seq) async {
    return (update(localQuoteInfoEntity)
          ..where((t) => t.dailyQuoteSeq.equals(seq)))
        .write(LocalQuoteInfoEntityCompanion(likeYn: Value(likeYn)));
  }

  Future<LocalQuoteInfoEntityData?> getQuote(int seq) => findQuoteById(seq);

  Future<void> clear() async {
    await delete(localQuoteInfoEntity).go();
  }

  Future<StreakInfoEntityData?> getStreakByDate(String date) =>
      (select(streakInfoEntity)..where((t) => t.date.equals(date)))
          .getSingleOrNull();

  Future<void> insertOrReplaceStreak(StreakInfoEntityCompanion streak) async {
    await into(streakInfoEntity).insert(streak, mode: InsertMode.replace);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
