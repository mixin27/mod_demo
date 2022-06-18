import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:domain/post/post.dart';
import 'package:infrastructure/post/extensions.dart';
import 'package:infrastructure/post/post_remote_service.dart';
import 'package:shared/shared.dart';

class PostRepository {
  final PostRemoteService _remoteService;

  PostRepository(this._remoteService);

  Future<Either<PostFailure, List<PostModel>>> getAllPosts() async {
    log('[PostRepository] getAllPosts() called!');

    try {
      final remoteData = await _remoteService.fetchAllPosts();

      return right(
        await remoteData.when(
          data: (data) => data.domainList,
          noConnection: () => [],
        ),
      );
    } on APIException catch (e) {
      return left(PostFailure.api(e.code, e.message));
    }
  }
}
