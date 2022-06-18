import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/providers/post/post_providers.dart';
import 'package:shared/shared.dart';

import 'widgets/post_list_view.dart';

class PostListingPage extends ConsumerStatefulWidget {
  const PostListingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostListingPageState createState() => _PostListingPageState();
}

class _PostListingPageState extends ConsumerState<PostListingPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    Future.microtask(
        () => ref.read(allPostsNotifierProvider.notifier).getAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: const PostListView(),
    );
  }
}
