import 'package:domain/post/post.dart';
import 'package:infrastructure/post/post_dto.dart';

extension PostDtoListToDomainList on List<PostDto> {
  List<PostModel> get domainList => map((e) => e.domain).toList();
}
