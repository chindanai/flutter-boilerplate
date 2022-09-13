part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final User user;

  const AuthenticationState({
    required this.user,
  });

  AuthenticationState copyWith({
    User? user,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}
