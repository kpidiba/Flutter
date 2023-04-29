import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:practice02/features/posts/presentation/widgets/loading_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: const Text("helo"),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Posts"),
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        // if (state is LoadingPostState) {
        //   return const LoadingWidget();
        // }
        //else if (state is LoadedPostState) {
        //   return PostListWidget(posts: state.posts);
        // }
        // else if (state is ErrorPostState) {
        //   return MessageDisplayWidget(message: state.message);
        // }
        return const LoadingWidget();
      }),
    );
  }
}
