import 'package:todos_api/todos_api.dart';

/// The interface for an API that providing access to a list of todos.
abstract class TodosApi {

  const TodosApi();

  Future<void> saveTodo(Todo todo);
}