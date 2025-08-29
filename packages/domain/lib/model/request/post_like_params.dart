import 'package:domain/model/request/like_request.dart';

class PostLikeParams {
  final int dailyQuoteSeq;
  final LikeRequest likeRequest;

  PostLikeParams({required this.dailyQuoteSeq, required this.likeRequest});
}
