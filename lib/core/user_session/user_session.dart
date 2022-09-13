abstract class UserSession {
  Future<void> loadSession();
  Future<void> clearSession();
  Future<void> saveSession(String accessToken, String refreshToken);

  bool get valid;
  String get refreshToken;
  String get accessToken;
}
