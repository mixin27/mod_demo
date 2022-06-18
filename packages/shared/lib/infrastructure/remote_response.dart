import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const factory RemoteResponse.noConnection() = _NoConnection<T>;
  const factory RemoteResponse.data(T data) = _Data<T>;
}
