import 'package:flutter_boilerplate/core/repository/repository.dart';
import 'package:flutter_boilerplate/modules/authentication/models/request_otp_form.dart';
import 'package:flutter_boilerplate/modules/authentication/models/login_with_social_form.dart';
import 'package:flutter_boilerplate/modules/authentication/models/request_otp_response.dart';
import 'package:flutter_boilerplate/modules/authentication/models/token.dart';
import 'package:flutter_boilerplate/modules/authentication/repository/guest.dart';
import 'package:flutter_boilerplate/network/network.dart';

class AuthenticationRepositoryImpl extends Repository
    implements AuthenticationRepository {
  AuthenticationRepositoryImpl(Network apiClient) : super(apiClient);

  @override
  Future<RequestOTPResponse> requestOTP(RequestOTPForm form) async {
    final response = await apiClient.post(
      '/user/otp',
      body: form.toJson(),
    );
    return RequestOTPResponse.fromJson(response.data);
  }

  @override
  Future<Token> loginWithSocial(LoginWithSocialForm form) async {
    final response = await apiClient.post(
      '/user/login/social',
      body: form.toJson(),
    );
    return Token.fromJson(response.data);
  }
}
