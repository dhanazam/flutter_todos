part of 'todos_overview_bloc.dart';

class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.todos = const []
  })

  final List<Todo> todos;
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}