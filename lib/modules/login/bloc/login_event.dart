part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEventLoginWithGoogle extends LoginEvent {
  const LoginEventLoginWithGoogle();
}

class LoginEventPhoneNumberChannged extends LoginEvent {
  final String phoneNumber;

  const LoginEventPhoneNumberChannged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class LoginEventSubmitted extends LoginEvent {
  const LoginEventSubmitted();
}
