import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: _AllTodos(),
        ),
        Tooltip(
          message: 'All Todos',
          child: TextButton(onPressed: () {}, child: const Text('All')),
        ),
        Tooltip(
          message: 'Only Uncompleted Todos',
          child: TextButton(onPressed: () {}, child: const Text('Active')),
        ),
        Tooltip(
          message: 'Only Completed Todos',
          child: TextButton(onPressed: () {}, child: const Text('Complete')),
        ),
      ],
    );
  }
}

class _AllTodos extends ConsumerWidget {
  const _AllTodos();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('toolbar build edildi');
    final onCompletedTodoCount = ref.watch(unCompletedTodoCount);
    return Text(
      onCompletedTodoCount == 0
          ? 'Tüm Görevler Tamamlandı'
          : '$onCompletedTodoCount görev tamamlanmadı.',
      overflow: TextOverflow.clip,
    );
  }
}
