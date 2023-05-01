import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:practice02/features/posts/presentation/widgets/loading_widget.dart';
import 'package:practice02/features/posts/presentation/widgets/message_display.dart';
import 'package:practice02/features/posts/presentation/widgets/post_list_widget.dart';

class PostPage extends StatelessWidget {
   const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(),
      // body: Container(child: Text("TESTING"),),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Posts"),
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is LoadingPostState) {
          return const LoadingWidget();
        } 
        else if (state is LoadedPostState) {
          return PostListWidget(posts: state.posts);
        } 
        else if (state is ErrorPostState) {
          return MessageDisplayWidget(message: state.message);
        }
        return const LoadingWidget();
      }),
    );
  }

  Widget _buildFloatingBtn() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
