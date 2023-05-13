import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:practice02/features/posts/presentation/pages/posts_page.dart';
import 'package:practice02/features/posts/presentation/widgets/post_crud_page/form_widget.dart';
import 'package:practice02/features/posts/presentation/widgets/post_pages/loading_widget.dart';
import 'package:practice02/utils/snackbar_message.dart';

import '../../domain/entities/post.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;

  const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(isUpdatePost ? "EDIT POST" : "ADD POST"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<CrudBloc, CrudState>(
          listener: (context, state) {
            if (state is MessageCrudState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostPage()),
                  (route) => false);
            } else if (state is ErrorCrudState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostPage()),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is LoadingCrudState) {
              return const LoadingWidget();
            } else {
              return FormWidget(
                isUpdatePost: isUpdatePost,
                post: isUpdatePost ? post : null,
              );
            }
          },
        ),
      ),
    );
  }
}
