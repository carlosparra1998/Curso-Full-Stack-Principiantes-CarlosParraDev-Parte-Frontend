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
    _orderTasks();
    Get.offAllNamed(RouteHelper.homeView);
  }

  Future<bool> createNewTask(Task task) async {
    Task? response = await repository.createNewTask(task);

    if (response == null) {
      return false;
    }

    tasks.add(response);
    _orderTasks();
    return true;
  }

  Future<bool> editTask(Task task) async {
    Task? response = await repository.editTask(task);
    if (response == null) {
      return false;
    }
    tasks.removeWhere((e) => e.id == task.id);
    tasks.add(response);
    _orderTasks();
    return true;
  }

  void markOrDismarkCompletitionTask(Task task, bool status) async {
    bool originalStatus = task.isComplete;
    task.isComplete = status;
    bool response = await editTask(task);
    if (!response) {
      task.isComplete = originalStatus;
      notifyListeners();
    }
  }

  Future<bool> deleteTask(Task task) async {
    final response = await repository.deleteTask(task);
    if (!response) return false;
    tasks.removeWhere((e) => e.id == task.id);
    _orderTasks();
    return true;
  }

  void _orderTasks() {
    tasks.sort((a, b) {
      if (a.isComplete != b.isComplete) {
        return a.isComplete ? 1 : -1;
      }

      if (a.priority == null && b.priority == null) {
        return 0;
      }

      if (a.priority == null) {
        return 1;
      }

      if (b.priority == null) {
        return -1;
      }

      return a.priority!.order.compareTo(b.priority!.order);
    });
    notifyListeners();
  }
}
