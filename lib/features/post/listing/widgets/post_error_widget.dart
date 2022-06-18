import 'package:flutter/material.dart';

class PostErrorWidget extends StatelessWidget {
  const PostErrorWidget({
    Key? key,
    required this.message,
    required this.onRefreshed,
  }) : super(key: key);

  final String message;
  final VoidCallback onRefreshed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: Text('Refresh'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
