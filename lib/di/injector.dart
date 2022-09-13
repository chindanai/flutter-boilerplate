import 'package:flutter_boilerplate/core/secure_storage/secure_storage.dart';
import 'package:flutter_boilerplate/core/user_session/impl/user_session.dart';
import 'package:flutter_boilerplate/core/user_session/user_session.dart';
import 'package:flutter_boilerplate/modules/authentication/repository/guest.dart';
import 'package:flutter_boilerplate/modules/authentication/repository/impl/guest.dart';
import 'package:flutter_boilerplate/modules/user/repository/impl/user.dart';
import 'package:flutter_boilerplate/modules/user/repository/user.dart';
import 'package:flutter_boilerplate/network/network.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  late UserRepository _userRepository;
  late AuthenticationRepository _authenticationRepository;
  late UserSession _userSession;

  static Injector get instance => _singleton;

  Injector._internal();

  void setup({
    required Network apiClient,
    required SecureStorage secureStorage,
  }) {
    _userRepository = UserRepositoryImpl(apiClient);
    _authenticationRepository = AuthenticationRepositoryImpl(apiClient);
    _userSession = UserSessionImpl(secureStorage);
  }

  UserSession get userSession => _userSession;

  UserRepository get userRepository => _userRepository;

  AuthenticationRepository get authenticationRepository =>
      _authenticationRepository;
}
