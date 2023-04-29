import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice02/core/error/failure.dart';
import 'package:practice02/core/strings/error.dart';
import 'package:practice02/core/strings/messages.dart';
import 'package:practice02/features/posts/domain/entities/post.dart';
import 'package:practice02/features/posts/domain/usecases/add_post.dart';
import 'package:practice02/features/posts/domain/usecases/delete_post.dart';
import 'package:practice02/features/posts/domain/usecases/update_post.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;
  CrudBloc(
      {required this.addPostUseCase,
      required this.updatePostUseCase,
      required this.deletePostUseCase})
      : super(CrudInitial()) {
    on<CrudEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingCrudState());
        final failureOrDoneMessage = await addPostUseCase(event.post);
        _mapFailureOrCrudToState(failureOrDoneMessage, ADD_SUCCESS_MESSAGE);
      } else if (event is UpdatePostEvent) {
        emit(LoadingCrudState());
        final failureOrDoneMessage = await updatePostUseCase(event.post);
        _mapFailureOrCrudToState(failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE);
      } else if (event is DeletePostEvent) {
        emit(LoadingCrudState());
        final failureOrDoneMessage = await deletePostUseCase(event.id);
        _mapFailureOrCrudToState(failureOrDoneMessage, DELETE_SUCCESS_MESSAGE);
      }
    });
  }

  CrudState _mapFailureOrCrudToState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorCrudState(message: _mapFailure(failure)),
        (posts) => MessageCrudState(message: message));
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
