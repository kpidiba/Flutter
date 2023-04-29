part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends CrudEvent {
  final Post post;
  const AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends CrudEvent {
  final Post post;
  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends CrudEvent {
  final int id;
  const DeletePostEvent({required this.id});

  @override
  List<Object> get props => [id];
}
