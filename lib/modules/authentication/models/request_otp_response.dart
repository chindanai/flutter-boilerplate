import 'package:json_annotation/json_annotation.dart';

part 'request_otp_response.g.dart';

@JsonSerializable()
class RequestOTPResponse {
  final String respCode;
  final String respDesc;
  final RequestOTPDetail detail;

  const RequestOTPResponse({
    required this.respCode,
    required this.respDesc,
    required this.detail,
  });

  factory RequestOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestOTPResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RequestOTPResponseToJson(this);
}

@JsonSerializable()
class RequestOTPDetail {
  final String id;
  final String reference;

  const RequestOTPDetail({
    required this.id,
    required this.reference,
  });

  factory RequestOTPDetail.fromJson(Map<String, dynamic> json) =>
      _$RequestOTPDetailFromJson(json);
  Map<String, dynamic> toJson() => _$RequestOTPDetailToJson(this);
}
