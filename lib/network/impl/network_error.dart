import 'package:equatable/equatable.dart';

class YPNetworkError extends Equatable implements Exception {
  const YPNetworkError(
    this._url, {
    required this.message,
    required this.statusCode,
    required this.internalStatusCode,
  });

  final String _url;
  final String message;
  final int statusCode;
  final String internalStatusCode;

  @override
  String toString() {
    return 'url: $_url message: $message, statusCode: $statusCode, internalStatusCode: $internalStatusCode';
  }

  @override
  List<Object?> get props => [_url, message, statusCode, internalStatusCode];
}
