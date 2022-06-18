import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:infrastructure/post/post_dto.dart';
import 'package:shared/shared.dart';

class PostRemoteService {
  final Dio _dio;

  PostRemoteService(this._dio);

  Future<RemoteResponse<List<PostDto>>> fetchAllPosts() async {
    log('[PostRemoteService] fetchAllPosts() called!');

    try {
      final response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final posts = data.map((e) => PostDto.fromJson(e)).toList();
        return RemoteResponse.data(posts);
      } else {
        throw APIException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.error != null) {
        throw APIException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }
}
