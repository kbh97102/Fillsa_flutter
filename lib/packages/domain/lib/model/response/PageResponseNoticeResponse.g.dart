// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PageResponseNoticeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponseNoticeResponse _$PageResponseNoticeResponseFromJson(
  Map<String, dynamic> json,
) => PageResponseNoticeResponse(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => NoticeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  currentPage: (json['currentPage'] as num).toInt(),
);

Map<String, dynamic> _$PageResponseNoticeResponseToJson(
  PageResponseNoticeResponse instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'currentPage': instance.currentPage,
};
