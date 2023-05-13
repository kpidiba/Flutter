import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/post/post_bloc.dart';
import 'package:practice02/features/posts/presentation/pages/post_add_update_page.dart';
import 'package:practice02/features/posts/presentation/widgets/post_pages/loading_widget.dart';
import 'package:practice02/features/posts/presentation/widgets/post_pages/message_display.dart';
import 'package:practice02/features/posts/presentation/widgets/post_pages/post_list_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
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
        } else if (state is LoadedPostState) {
          return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: PostListWidget(posts: state.posts));
        } else if (state is ErrorPostState) {
          return MessageDisplayWidget(message: state.message);
        }
        return const LoadingWidget();
      }),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostBloc>(context).add(RefreshPostEvent());
  }

  Widget _buildFloatingBtn(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const PostAddUpdatePage(isUpdatePost: false)));
      },
      child: const Icon(Icons.add),
    );
  }
}
