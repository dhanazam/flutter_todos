import 'package:todos_repository/todos_repository.dart';

enum TodosViewFilter { all }

extension TodosViewFilterX on TodosViewFilter {
  bool apply(Todo todo) {
    switch (this) {
      case TodosViewFilter.all:
        return true;
    }
  }

  Iterable<Todo> applyAll(Iterable<Todo> todos) {
    return todos.where(apply);
  }
}
