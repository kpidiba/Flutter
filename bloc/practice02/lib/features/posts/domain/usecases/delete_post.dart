import 'package:dartz/dartz.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/features/posts/domain/repositories/posts_repository.dart';

class DeletePostUseCase {
  final PostsRepository repository;
  DeletePostUseCase( this.repository);
  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deletePost(id);
  }
}
