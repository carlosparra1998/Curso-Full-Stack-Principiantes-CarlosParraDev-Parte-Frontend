class TaskPriority {
  late int id;
  late String name;
  late int order;

  TaskPriority({required this.id, required this.name, required this.order});

  TaskPriority.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskPriority &&
            runtimeType == other.runtimeType &&
            id == other.id);
  }

  @override
  int get hashCode => id.hashCode;
}
