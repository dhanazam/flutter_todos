import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/todos_api.dart';

/// {@template local_storage_todos_api}
/// A Flutter implementation of the TodosApi that uses local storage.
/// {@endtemplate}
class LocalStorageTodosApi {
  /// {@macro local_storage_todos_api}
  const LocalStorageTodosApi({
    required SharedPreferences plugin,
  }): _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(
    const [],
  );

  void _init() {

  }

  @override
  Future<void> saveTodo(Todo todo) {

  }
}
