import 'package:flutter_boilerplate/modules/authentication/models/request_otp_form.dart';
import 'package:flutter_boilerplate/modules/authentication/models/login_with_social_form.dart';
import 'package:flutter_boilerplate/modules/authentication/models/request_otp_response.dart';
import 'package:flutter_boilerplate/modules/authentication/models/token.dart';

abstract class AuthenticationRepository {
  Future<RequestOTPResponse> requestOTP(RequestOTPForm form);

  Future<Token> loginWithSocial(LoginWithSocialForm form);
}
