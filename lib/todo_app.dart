import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/providers/all_providers.dart';
import 'package:todos/widgets/title_widget.dart';
import 'package:todos/widgets/todo_list_item_widget.dart';
import 'package:todos/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

import 'models/todo_model.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});

  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoModel> allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            TitleWidget(),
            TextField(
              controller: newTodoController,
              decoration:
                  const InputDecoration(labelText: 'Neler Yapıyoruz Bugün'),
              onSubmitted: (newTodo) {
                ref.read(todoListProvider.notifier).addTodo(newTodo);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ToolBarWidget(),
            for (var i = 0; i < allTodos.length; i++)
              Dismissible(
                  key: ValueKey(allTodos[i].id),
                  onDismissed: (_) {
                    ref.read(todoListProvider.notifier).remove(allTodos[i]);
                  },

                  child:  ProviderScope(
                      overrides: [
                        currentTodoProvider.overrideWithValue(allTodos[i]),
                      ],
                      child: const TodoListItemWidget())),
          ]),
    );
  }
}
