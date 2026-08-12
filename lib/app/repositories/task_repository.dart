import 'package:my_tasks_frontend/app/core/services/api_service.dart';
import 'package:my_tasks_frontend/app/models/task.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';

class TaskRepository {
  final ApiService api;

  TaskRepository(this.api);

  Future<List<Task>> getTasks() async {
    return await api.getTasks();
  }

  Future<List<TaskPriority>> getTaskPriorities() async {
    return await api.getTaskPriorities();
  }
}
