import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/edit_todo/edit_todo.dart';
import 'package:flutter_todos/todos_overview/todos_overview.dart';
import 'package:todos_repository/todos_repository.dart';

class TodosOverviewPage extends StatelessWidget {
  const TodosOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosOverviewBloc(
        todosRepository: context.read<TodosRepository>(),
      )..add(const TodosOverviewSubscriptionRequested()),
      child: const TodosOverviewView(),
    );
  }
}

class TodosOverviewView extends StatelessWidget {
  const TodosOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            key: const Key('todosOverviewPage_deleteAll_iconButton'),
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<TodosOverviewBloc>().add(
                    const TodosOverviewAllDeleted(),
                  );
            },
          ),
        ],
      ),
      body: BlocBuilder<TodosOverviewBloc, TodosOverviewState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Text('Tap + to add a new todo'),
            );
          }

          return ListView(
            children: [
              for (final todo in state.filteredTodos)
                ListTile(
                  key: Key('todoListTile_dismissible_${todo.id}'),
                  title: Text(todo.title),
                  trailing: IconButton(
                    key: Key('todoListTile_deleteIcon_${todo.id}'),
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<TodosOverviewBloc>()
                          .add(TodosOverviewDeleted(todo));
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      EditTodoPage.route(initialTodo: todo),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
