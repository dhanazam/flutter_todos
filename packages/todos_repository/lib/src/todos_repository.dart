import 'package:todos_api/todos_api.dart';

/// A repository that handles `todo` related requests.
class TodosRepository {
  const TodosRepository({
    required TodosApi todosApi,
  }) : _todosApi = todosApi;

  final TodosApi _todosApi;

  Stream<List<Todo>> getTodos() => _todosApi.getTodos();

  /// saves a [todo]
  /// If a [todo] with the same id already exists, it will be replaced.
  Future<void> saveTodo(Todo todo) => _todosApi.saveTodo(todo);

  /// Deletes a [todo] with the given [id].
  /// If no [todo] with the given [id] exists, a [TodoNotFoundException] will be thrown.
  Future<void> deleteTodo(String id) => _todosApi.deleteTodo(id);

  /// Deletes all [todo]s.
  Future<void> deleteAllTodos() => _todosApi.deleteAllTodos();
}
