import 'package:dio/dio.dart';
import 'package:my_tasks_frontend/app/core/constants/constants.dart';
import 'package:my_tasks_frontend/app/models/task.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: Constants.API_URL));

  Future<List<Task>> getTasks() async {
    try {
      final response = await dio.get("/tasks");
      if (response.data == null) {
        return [];
      }

      return (response.data as List).map((e) => Task.fromJson(e)).toList();
    } on Exception catch (_) {
      return [];
    }
  }

  Future<List<TaskPriority>> getTaskPriorities() async {
    try {
      final response = await dio.get("/task-priorities");
      if (response.data == null) {
        return [];
      }

      return (response.data as List)
          .map((e) => TaskPriority.fromJson(e))
          .toList();
    } on Exception catch (_) {
      return [];
    }
  }

  Future<Task?> createNewTask(Task task) async {
    try {
      final response = await dio.post("/tasks/", data: task.toJson());
      if (response.data == null) {
        return null;
      }

      return Task.fromJson(response.data);
    } on Exception catch (_) {
      return null;
    }
  }
}
