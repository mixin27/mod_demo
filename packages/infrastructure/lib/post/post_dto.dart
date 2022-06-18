import 'package:domain/post/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
class PostDto with _$PostDto {
  const PostDto._();
  const factory PostDto({
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  PostModel get domain => PostModel(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );
}
