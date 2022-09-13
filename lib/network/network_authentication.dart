abstract class NetworkAuthentication {
  Future<String?> get accessToken;

  Future<String?> get userId;

  Future<bool> doRefreshToken();
}
