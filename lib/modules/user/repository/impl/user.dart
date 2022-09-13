import 'package:flutter_boilerplate/core/repository/repository.dart';
import 'package:flutter_boilerplate/modules/user/models/user.dart';
import 'package:flutter_boilerplate/modules/user/repository/user.dart';
import 'package:flutter_boilerplate/network/network.dart';

class UserRepositoryImpl extends Repository implements UserRepository {
  UserRepositoryImpl(Network apiClient) : super(apiClient);

  @override
  Future<User> getMe() {
    throw UnimplementedError();
  }
}
