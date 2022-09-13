// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOTPResponse _$RequestOTPResponseFromJson(Map<String, dynamic> json) =>
    RequestOTPResponse(
      respCode: json['respCode'] as String,
      respDesc: json['respDesc'] as String,
      detail: RequestOTPDetail.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestOTPResponseToJson(RequestOTPResponse instance) =>
    <String, dynamic>{
      'respCode': instance.respCode,
      'respDesc': instance.respDesc,
      'detail': instance.detail,
    };

RequestOTPDetail _$RequestOTPDetailFromJson(Map<String, dynamic> json) =>
    RequestOTPDetail(
      id: json['id'] as String,
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$RequestOTPDetailToJson(RequestOTPDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
    };
