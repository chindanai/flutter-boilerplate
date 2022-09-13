part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final String phoneNumber;
  final String otpRef;

  const LoginState({
    this.status = FormzStatus.pure,
    this.phoneNumber = '',
    this.otpRef = '',
  });

  LoginState copyWith({
    FormzStatus? status,
    String? phoneNumber,
    String? otpRef,
  }) {
    return LoginState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otpRef: otpRef ?? this.otpRef,
    );
  }

  @override
  List<Object> get props => [
        status,
        phoneNumber,
        otpRef,
      ];
}
