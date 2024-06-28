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
}
