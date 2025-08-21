// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PageResponseMemberQuotesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponseMemberQuotesResponse _$PageResponseMemberQuotesResponseFromJson(
  Map<String, dynamic> json,
) => PageResponseMemberQuotesResponse(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => MemberQuotesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  currentPage: (json['currentPage'] as num).toInt(),
);

Map<String, dynamic> _$PageResponseMemberQuotesResponseToJson(
  PageResponseMemberQuotesResponse instance,
) => <String, dynamic>{
  'content': instance.content,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'currentPage': instance.currentPage,
};
