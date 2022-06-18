import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_failure.freezed.dart';

@freezed
class PostFailure with _$PostFailure {
  const factory PostFailure.api(
    int? errorCode,
    String? message,
  ) = _Api;
}
