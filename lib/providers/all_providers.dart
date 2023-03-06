import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>(
        (ref) => TodoListManager([
              TodoModel(id: const Uuid().v4(), description: 'Spora Git'),
              TodoModel(id: const Uuid().v4(), description: 'Ders Çalış'),
              TodoModel(id: const Uuid().v4(), description: 'Yazılım Öğren'),
            ]));

final unCompletedTodoCount = Provider<int>((ref) {
  final allTodo = ref.watch(todoListProvider);
  final count = allTodo.where((element) => !element.completed).length;

  return count;
});

final currentTodoProvider = Provider<TodoModel>((ref) {
  throw UnimplementedError();
});
