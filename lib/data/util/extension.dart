import 'package:drift/drift.dart';
import 'package:fillsa_flutter/domain/model/local_quote_info.dart';

import '../local/local_database.dart';

extension LocalQuoteInfoMapper on LocalQuoteInfo {
  LocalQuoteInfoEntityCompanion toEntity({bool forUpdate = false}) {
    return LocalQuoteInfoEntityCompanion(
      dailyQuoteSeq: Value(dailyQuoteSeq),
      korQuote: Value(korQuote),
      engQuote: Value(engQuote),
      korAuthor: Value(korAuthor),
      engAuthor: Value(engAuthor),
      korTyping: Value(korTyping),
      engTyping: Value(engTyping),
      likeYn: Value(likeYn),
      memo: Value(memo),
      date: Value(date),
      dayOfWeek: Value(dayOfWeek),
    );
  }
}

extension LocalQuoteInfoEntityMapper on LocalQuoteInfoEntityData {
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
