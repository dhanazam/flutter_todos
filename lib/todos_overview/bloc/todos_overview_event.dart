part of 'todos_overview_bloc.dart';

sealed class TodosOverviewEvent extends Equatable {
  const TodosOverviewEvent();

  @override
  List<Object> get props => [];
}

class TodosOverviewSubscriptionRequested extends TodosOverviewEvent {
  const TodosOverviewSubscriptionRequested();
}

class TodosOverviewDeleted extends TodosOverviewEvent {
  const TodosOverviewDeleted(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
