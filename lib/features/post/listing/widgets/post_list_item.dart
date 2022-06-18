import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            padding: const EdgeInsets.all(AppInsets.defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppInsets.defaultCornerRadius),
                topRight: Radius.circular(AppInsets.defaultCornerRadius),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppInsets.defaultPadding),
                    child: const Divider(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(AppInsets.defaultPadding),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppInsets.defaultCornerRadius,
                      ),
                    ),
                    child: Text(
                      post.body,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppInsets.defaultPadding,
        vertical: AppInsets.defaultPadding,
      ),
      leading: Text(post.id.toString()),
      title: Text(
        post.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        post.body,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
