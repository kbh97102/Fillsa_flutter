import '../../domain/model/local_quote_info.dart';
import '../local/local_quote_info_entity.dart';

extension LocalQuoteInfoMapper on LocalQuoteInfo {
  LocalQuoteInfoEntity toEntity() {
    return LocalQuoteInfoEntity(
      dailyQuoteSeq: dailyQuoteSeq,
      korQuote: korQuote,
      engQuote: engQuote,
      korAuthor: korAuthor,
      engAuthor: engAuthor,
      korTyping: korTyping,
      engTyping: engTyping,
      likeYn: likeYn,
      memo: memo,
      date: date,
      dayOfWeek: dayOfWeek,
    );
  }
}

extension LocalQuoteInfoEntityMapper on LocalQuoteInfoEntity {
  LocalQuoteInfo toModel() {
    return LocalQuoteInfo(
      dailyQuoteSeq: dailyQuoteSeq,
      korQuote: korQuote,
      engQuote: engQuote,
      korAuthor: korAuthor,
      engAuthor: engAuthor,
      korTyping: korTyping,
      engTyping: engTyping,
      likeYn: likeYn,
      memo: memo,
      date: date,
      dayOfWeek: dayOfWeek,
    );
  }
}
