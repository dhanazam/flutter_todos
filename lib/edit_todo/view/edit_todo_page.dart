import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/edit_todo/edit_todo.dart';
import 'package:todos_repository/todos_repository.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  static Route<void> route({ Todo? initialTodo }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => EditTodoBloc(
          todosRepository: context.read<TodosRepository>(),
          initialTodo: initialTodo
        ),
        child: const EditTodoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoBloc, EditTodoState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == EditTodoStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      child: const EditTodoView(),
    );
  }
}

class EditTodoView extends StatelessWidget {
  const EditTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<EditTodoBloc>().add(const EditTodoSubmitted()),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [_TitleField(), _DescriptionField()],
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditTodoBloc>().state;

    return TextFormField(
      key: const Key('editTodoView_title_TextFormField'),
      initialValue: state.title,
      onChanged: (value) {
        context.read<EditTodoBloc>().add(EditTodoTitleChanged(value));
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditTodoBloc>().state;
    return TextFormField(
      key: const Key('editTodoView_description_textFormField'),
      initialValue: state.description,
      onChanged: (value) {
        context.read<EditTodoBloc>().add(EditTodoDescriptionChanged(value));
      },
    );
  }
}
