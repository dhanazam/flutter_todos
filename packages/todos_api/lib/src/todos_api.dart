import 'package:todos_api/todos_api.dart';

/// The interface for an API that providing access to a list of todos.
abstract class TodosApi {
  const TodosApi();

  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);
}

class TodoNotFoundException implements Exception {}
