
import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPost();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatedPost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
