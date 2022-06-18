class APIException implements Exception {
  final int? code;
  final String? message;

  APIException({
    this.code = 9999,
    this.message = 'Unknown Error',
  });
}
