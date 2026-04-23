class ApiEndPoints {
  const ApiEndPoints._();

  // Kotlin의 const val은 Dart의 static const와 동일한 역할을 합니다.
  // Dart에서는 상수 이름을 lowerCamelCase로 작성하는 것이 관례입니다.
  static const String login = "/api/v1/auth/login";
  static const String getDailyQuoteNonMember = "/api/v1/quotes/daily";
  static const String getDailyQuote = "/api/v1/member-quotes/daily";
  static const String postLike = "/api/v1/member-quotes/{dailyQuoteSeq}/like";
  static const String postUploadImage =
      "/api/v1/member-quotes/{dailyQuoteSeq}/images";
  static const String deleteUploadImage =
      "/api/v1/member-quotes/{dailyQuoteSeq}/images";
  static const String getQuoteList = "/api/v2/member-quotes";
  static const String postSaveMemo =
      "/api/v1/member-quotes/{memberQuoteSeq}/memo";
  static const String getMemberMonthlyQuotes = "/api/v1/member-quotes/monthly";
  static const String getNotice = "/api/v1/notices";
  static const String deleteResign = "/api/v1/auth/withdraw";
  static const String updateAccessToken = "/api/v1/auth/refresh";
  static const String postTyping =
      "/api/v1/member-quotes/{dailyQuoteSeq}/typing";
  static const String getTyping =
      "/api/v1/member-quotes/{dailyQuoteSeq}/typing";
  static const String getMonthlyQuotes = "/api/v1/quotes/monthly";
  static const String getMemberStreaks = "/api/v1/member-streaks";
}
