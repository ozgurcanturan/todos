class TodoModel {
  final String id;
  final String description;
  final bool completed;

  TodoModel(
      {required this.id, this.completed = false, required this.description});
}
