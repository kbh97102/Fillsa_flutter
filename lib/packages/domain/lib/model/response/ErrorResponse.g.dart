// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      timestamp: json['timestamp'] as String,
      httpStatus: (json['httpStatus'] as num).toInt(),
      errorCode: (json['errorCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'httpStatus': instance.httpStatus,
      'errorCode': instance.errorCode,
      'message': instance.message,
    };
