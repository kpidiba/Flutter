import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/features/posts/domain/repositories/posts_repository.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;
  GetAllPostsUseCase(this.repository);
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPost();
  }
}
