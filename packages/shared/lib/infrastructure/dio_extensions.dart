import 'dart:io';

import 'package:dio/dio.dart';

/// [Dio] utilities.
///
extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.other && error is SocketException;
}
