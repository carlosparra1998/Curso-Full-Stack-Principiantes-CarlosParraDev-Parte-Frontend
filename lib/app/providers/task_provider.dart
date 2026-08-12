import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tasks_frontend/app/core/routes/route_helper.dart';
import 'package:my_tasks_frontend/app/models/task.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';
import 'package:my_tasks_frontend/app/repositories/task_repository.dart';

class TaskProvider with ChangeNotifier {
  final TaskRepository repository;

  TaskProvider(this.repository);

  List<Task> tasks = [];
  List<TaskPriority> priorities = [];

  Future<void> loadDependencies() async {
    tasks = await repository.getTasks();
    priorities = await repository.getTaskPriorities();
    Get.offAllNamed(RouteHelper.homeView);
  }
}
