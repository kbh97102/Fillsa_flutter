import 'package:floor/floor.dart';

import 'local_quote_info_entity.dart';

@dao
abstract class LocalQuoteInfoDao {
  @Query('SELECT * FROM quoteInfo ORDER BY date DESC')
  Future<List<LocalQuoteInfoEntity>> getAllQuotes();

  @Query('SELECT * FROM quoteInfo WHERE id = :seq')
  Future<LocalQuoteInfoEntity?> findQuoteById(int seq);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQuote(LocalQuoteInfoEntity quote);

  @delete
  Future<void> deleteQuote(LocalQuoteInfoEntity quote);

  @Query('DELETE FROM quoteInfo WHERE id = :seq')
  Future<void> deleteQuoteById(int seq);

  @update
  Future<void> updateQuote(LocalQuoteInfoEntity quote);

  @Query(
    'SELECT * FROM quoteInfo WHERE date BETWEEN :startDate AND :endDate ORDER BY date DESC LIMIT 10 OFFSET :offset',
  )
  Future<List<LocalQuoteInfoEntity>> getPagingList(
    int offset,
    String startDate,
    String endDate,
  );

  @Query(
    'SELECT * FROM quoteInfo WHERE (likeYn = :likeYn AND date BETWEEN :startDate AND :endDate) ORDER BY date DESC LIMIT 10 OFFSET :offset',
  )
  Future<List<LocalQuoteInfoEntity>> getPagingListWithLike(
    int offset,
    String likeYn,
    String startDate,
    String endDate,
  );

  @Query('UPDATE quoteInfo SET memo = :memo WHERE id = :seq')
  Future<void> updateMemo(String memo, int seq);

  @Query('UPDATE quoteinfo SET likeYn = :likeYn WHERE id = :seq')
  Future<int?> updateLike(String likeYn, int seq);

  @Query('SELECT * FROM quoteInfo WHERE id = :seq')
  Future<LocalQuoteInfoEntity?> getQuote(int seq);

  @Query('DELETE FROM quoteInfo')
  Future<void> clear();
}
