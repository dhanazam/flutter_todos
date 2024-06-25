part of 'edit_todo_bloc.dart';

enum EditTodoStatus { initial, loading, success, failure }

extension EditTodoStatusX on EditTodoStatus {
  bool get isLoadingOrSuccess => [
        EditTodoStatus.loading,
        EditTodoStatus.success,
      ].contains(this);
}

class EditTodoState extends Equatable {
  const EditTodoState({
    this.status = EditTodoStatus.initial,
    this.title = '',
    this.description = '',
  });

  final EditTodoStatus status;
  final String title;
  final String description;

  EditTodoState copyWith({
    EditTodoStatus? status,
    String? title,
    String? description,
  }) {
    return EditTodoState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [status, title, description];
}