import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/features/posts/domain/repositories/posts_repository.dart';

class AddPostUseCase {
  final PostsRepository repository;
  AddPostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
