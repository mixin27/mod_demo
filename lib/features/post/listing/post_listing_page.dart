import 'package:flutter/material.dart';

class PostListingPage extends StatelessWidget {
  const PostListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: Center(
        child: Text(
          'Recent Posts'.toUpperCase(),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
