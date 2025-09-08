import 'package:drift/drift.dart';
import 'package:fillsa_flutter/data/util/extension.dart';
import 'package:fillsa_flutter/domain/model/local_quote_info.dart';

import 'local_database.dart';
import 'local_quote_info_entity.dart';

part 'local_quote_info_dao.g.dart';

@DriftAccessor(tables: [LocalQuoteInfoEntity])
class QuoteInfoDao extends DatabaseAccessor<LocalDatabase>
    with _$QuoteInfoDaoMixin {
  QuoteInfoDao(LocalDatabase db) : super(db);

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
}
