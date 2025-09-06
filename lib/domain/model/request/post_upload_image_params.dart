import 'dart:io';

class PostUploadImageParams {
  final int dailyQuoteSeq;
  final File imageFile;

  PostUploadImageParams({required this.dailyQuoteSeq, required this.imageFile});
}
