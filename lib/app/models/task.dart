import 'task_priority.dart';

class Task {
  late int id;
  late String title;
  late bool isComplete;
  late TaskPriority? priority;

  Task({
    required this.id,
    required this.title,
    required this.isComplete,
    required this.priority,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isComplete = json['is_complete'];
    priority = json['priority'] == null
        ? null
        : TaskPriority.fromJson(json['priority']);
  }
  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'priority_id': priority?.id,
      'is_complete': isComplete,
    };
  }
}
