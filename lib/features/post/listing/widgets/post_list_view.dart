import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

import 'post_error_widget.dart';
import 'post_list_item.dart';

class PostListView extends HookConsumerWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsState = ref.watch(allPostsNotifierProvider);

    return postsState.map(
      initial: (_) => Container(),
      loading: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
      success: (_) {
        final posts = _.posts;
        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(allPostsNotifierProvider.notifier).getAllPosts();
          },
          child: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostListItem(post: post);
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
      error: (_) => PostErrorWidget(
        message: _.failure.message ?? 'Unknown Error',
        onRefreshed: () {
          ref.read(allPostsNotifierProvider.notifier).getAllPosts();
        },
      ),
      empty: (_) => PostErrorWidget(
        message: 'No posts available.',
        onRefreshed: () {
          ref.read(allPostsNotifierProvider.notifier).getAllPosts();
        },
      ),
    );
  }
}
