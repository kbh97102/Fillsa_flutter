import 'package:floor/floor.dart';

@Entity(tableName: 'quoteInfo')
class LocalQuoteInfoEntity {
  @PrimaryKey()
  @ColumnInfo(name: 'id')
  final int dailyQuoteSeq;

  final String korQuote;
  final String engQuote;
  final String korAuthor;
  final String engAuthor;
  final String korTyping;
  final String engTyping;
  final String likeYn;
  final String memo;
  final String date;
  final String dayOfWeek;

  LocalQuoteInfoEntity({
    required this.dailyQuoteSeq,
    required this.korQuote,
    required this.engQuote,
    required this.korAuthor,
    required this.engAuthor,
    required this.korTyping,
    required this.engTyping,
    required this.likeYn,
    required this.memo,
    required this.date,
    required this.dayOfWeek,
  });
}
