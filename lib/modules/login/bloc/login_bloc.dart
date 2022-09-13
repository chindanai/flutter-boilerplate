import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_boilerplate/modules/authentication/models/request_otp_form.dart';
import 'package:flutter_boilerplate/modules/authentication/models/login_with_social_form.dart';
import 'package:flutter_boilerplate/modules/authentication/repository/guest.dart';
import 'package:flutter_boilerplate/network/impl/network_error.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEventLoginWithGoogle>(_onLoginWithGoogle);
    on<LoginEventPhoneNumberChannged>(_onPhoneNumberChannged);
    on<LoginEventSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onLoginWithGoogle(
    LoginEventLoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      GoogleSignIn globalGoogleSignInObject = GoogleSignIn(
        scopes: <String>['email', 'profile', 'openid'],
      );
      if (await globalGoogleSignInObject.isSignedIn()) {
        await globalGoogleSignInObject.signOut();
      }
      final googleRes = await globalGoogleSignInObject.signIn();
      final auth = await googleRes!.authentication;
      await _authenticationRepository.loginWithSocial(LoginWithSocialForm(
        type: SocialType.google,
        token: auth.idToken!,
      ));
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
      ));
    } on YPNetworkError catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    }
  }

  void _onPhoneNumberChannged(
    LoginEventPhoneNumberChannged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
    ));
  }

  void _onSubmitted(
    LoginEventSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      status: FormzStatus.submissionInProgress,
    ));

    try {
      final response = await _authenticationRepository.requestOTP(
        RequestOTPForm(
          phoneNumber: state.phoneNumber,
        ),
      );
      emit(state.copyWith(
        otpRef: response.detail.reference,
        status: FormzStatus.submissionSuccess,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    }
  }
}
