import 'package:flutter_boilerplate/network/network.dart';

abstract class Repository {
  final Network apiClient;

  Repository(this.apiClient);
}
