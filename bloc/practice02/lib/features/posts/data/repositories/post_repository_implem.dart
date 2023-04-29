import 'package:practice02/core/error/exception.dart';
import 'package:practice02/core/network/network_info.dart';
import 'package:practice02/features/posts/data/datasourcces/post_local_data_source.dart';
import 'package:practice02/features/posts/data/datasourcces/post_remote_data_source.dart';
import 'package:practice02/features/posts/data/models/post_model.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practice02/features/posts/domain/repositories/posts_repository.dart';

typedef Future<Unit> DeleteOrUpdateOrAddPost();

class PostRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    if (await networkInfo.isConnected) {
      return await _getMessage(() {
        return remoteDataSource.addPost(postModel);
      });
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if (await networkInfo.isConnected) {
      return await _getMessage(() {
        return remoteDataSource.deletePost(id);
      });
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPost() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachePosts();
        return Right(localPosts);
      } on EmptyCacheFailure {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatedPost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    if (await networkInfo.isConnected) {
      return await _getMessage(() {
        return remoteDataSource.updatePost(postModel);
      });
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}