import 'package:flutter_boilerplate/modules/user/models/user.dart';

abstract class UserRepository {
  Future<User> getMe();
}
