import 'package:flutter_boilerplate/core/secure_storage/secure_storage.dart';
import 'package:flutter_boilerplate/core/user_session/user_session.dart';

class UserSessionImpl implements UserSession {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final SecureStorage _secureStorage;
  String? _accessToken;
  String? _refreshToken;

  UserSessionImpl(this._secureStorage);

  @override
  String get accessToken => _accessToken ?? '';

  @override
  String get refreshToken => _refreshToken ?? '';

  @override
  bool get valid => _accessToken != null && _accessToken != '';

  @override
  Future<void> loadSession() async {
    _accessToken = await _secureStorage.read(_accessTokenKey);
    _refreshToken = await _secureStorage.read(_refreshTokenKey);
  }

  @override
  Future<void> clearSession() async {
    _accessToken = null;
    _refreshToken = null;
    await _secureStorage.delete(_accessTokenKey);
    await _secureStorage.delete(_refreshTokenKey);
  }

  @override
  Future<void> saveSession(String accessToken, String refreshToken) async {
    if (accessToken == '' || refreshToken == '') {
      return;
    }

    try {
      _accessToken = accessToken;
      _refreshToken = refreshToken;
      await _secureStorage.write(_accessTokenKey, accessToken);
      await _secureStorage.write(_refreshTokenKey, refreshToken);
    } catch (_) {}
  }
}
