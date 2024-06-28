part of 'todos_overview_bloc.dart';

class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.todos = const [],
    this.filter = TodosViewFilter.all,
  });

  final List<Todo> todos;
  final TodosViewFilter filter;

  Iterable<Todo> get filteredTodos => filter.applyAll(todos);

  @override
  List<Object?> get props => [todos];

  TodosOverviewState copyWith({
    List<Todo> Function()? todos,
    TodosViewFilter Function()? filter,
  }) {
    return TodosOverviewState(
      todos: todos != null ? todos() : this.todos,
      filter: filter != null ? filter() : this.filter,
    );
  }
}
