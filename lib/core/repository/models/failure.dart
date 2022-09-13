class Failure {
  final String? _message;

  Failure(this._message);

  String getMessage() {
    return _message ?? "Unknown error";
  }
}
