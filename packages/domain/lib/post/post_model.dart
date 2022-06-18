import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const PostModel._();
  const factory PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostModel;
}
