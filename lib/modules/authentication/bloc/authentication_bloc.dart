import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/user/models/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          user: User.pure(),
        )) {
    on<AuthenticationEventGetMe>(_onGetMe);
  }

  void _onGetMe(
    AuthenticationEventGetMe event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(
      user: User.pure(),
    ));
  }
}
