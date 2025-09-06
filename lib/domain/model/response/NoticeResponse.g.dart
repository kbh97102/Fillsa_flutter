// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoticeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeResponse _$NoticeResponseFromJson(Map<String, dynamic> json) =>
    NoticeResponse(
      noticeSeq: (json['noticeSeq'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$NoticeResponseToJson(NoticeResponse instance) =>
    <String, dynamic>{
      'noticeSeq': instance.noticeSeq,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
