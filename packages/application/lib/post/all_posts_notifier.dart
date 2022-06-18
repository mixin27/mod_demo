import 'dart:developer';

import 'package:domain/post/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infrastructure/post/post.dart';

part 'all_posts_notifier.freezed.dart';

@freezed
class AllPostsState with _$AllPostsState {
  const factory AllPostsState.initial() = _Initial;
  const factory AllPostsState.loading() = _Loading;
  const factory AllPostsState.success(
    List<PostModel> posts,
  ) = _Success;
  const factory AllPostsState.error(
    PostFailure failure,
  ) = _Error;
  const factory AllPostsState.empty() = _Empty;
}

class AllPostsNotifier extends StateNotifier<AllPostsState> {
  final PostRepository _repository;

  AllPostsNotifier(this._repository) : super(const AllPostsState.initial());

  Future<void> getAllPosts() async {
    state = const AllPostsState.loading();
    log('[AllPostsNotifier] getAllPosts() called!');

    final failureOrSuccess = await _repository.getAllPosts();

    state = failureOrSuccess.fold(
      (l) => AllPostsState.error(l),
      (r) => r.isEmpty ? const AllPostsState.empty() : AllPostsState.success(r),
    );
  }
}
