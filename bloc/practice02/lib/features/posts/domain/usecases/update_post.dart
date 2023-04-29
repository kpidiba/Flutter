import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/features/posts/domain/repositories/posts_repository.dart';

class UpdatePostUseCase {
  final PostsRepository repository;
  UpdatePostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatedPost(post);
  }
}
