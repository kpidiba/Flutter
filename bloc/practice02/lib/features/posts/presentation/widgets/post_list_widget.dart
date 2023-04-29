import 'package:flutter/material.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(posts[index].id.toString()),
              title: Text(
                posts[index].title.toString(),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
          separatorBuilder: (context, builder) => const Divider(
                thickness: 1,
              ),
          itemCount: posts.length),
    );
  }
}
