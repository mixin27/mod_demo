import 'package:application/post/all_posts_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infrastructure/post/post.dart';
import 'package:shared/providers/providers.dart';

final postRemoteServiceProvider = Provider(
  (ref) => PostRemoteService(
    ref.watch(dioProvider),
  ),
);

final postRepositoryProvider = Provider(
  (ref) => PostRepository(
    ref.watch(postRemoteServiceProvider),
  ),
);

final allPostsNotifierProvider =
    StateNotifierProvider<AllPostsNotifier, AllPostsState>(
  (ref) => AllPostsNotifier(
    ref.watch(postRepositoryProvider),
  ),
);
