import 'package:drift/drift.dart';

class LocalQuoteInfoEntity extends Table {
  IntColumn get dailyQuoteSeq => integer().named('id')();
  TextColumn get korQuote => text()();
  TextColumn get engQuote => text()();
  TextColumn get korAuthor => text()();
  TextColumn get engAuthor => text()();
  TextColumn get korTyping => text()();
  TextColumn get engTyping => text()();
  TextColumn get likeYn => text()();
  TextColumn get memo => text()();
  TextColumn get date => text()();
  TextColumn get dayOfWeek => text()();

  @override
  String get tableName => 'quoteInfo';

  @override
  Set<Column> get primaryKey => {dailyQuoteSeq};
}
