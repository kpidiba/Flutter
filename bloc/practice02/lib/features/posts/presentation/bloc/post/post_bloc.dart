import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/core/strings/error.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/features/posts/domain/usecases/get_all_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPostsUseCase getAllPosts;
  PostBloc({required this.getAllPosts}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is GetAllPostEvent) {
        emit(LoadingPostState());
        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshPostEvent) {
        emit(LoadingPostState());
        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  PostState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => ErrorPostState(message: _mapFailure(failure)),
        (posts) => LoadedPostState(posts: posts));
  }

  String _mapFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexcepted Error,Please try again later";
    }
  }
}
