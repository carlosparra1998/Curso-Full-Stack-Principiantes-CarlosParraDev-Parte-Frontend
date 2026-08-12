import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/features/home/dialogs/create_or_edit_task_dialog/create_or_edit_task_form.dart';
import 'package:my_tasks_frontend/app/models/task.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';
import 'package:my_tasks_frontend/app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CreateOrEditTaskController with ChangeNotifier {
  CreateOrEditTaskForm form = CreateOrEditTaskForm.init();
  Task? editableTask;

  CreateOrEditTaskController() {
    form = CreateOrEditTaskForm.init();
  }

  void update() {
    notifyListeners();
  }

  Future<bool> createOrEditTask(BuildContext context) async {
    Task newTask = Task(
      id: 0,
      title: form.controller.text.trim(),
      isComplete: false,
      priority: form.selectedPriority,
    );
    return await context.read<TaskProvider>().createNewTask(newTask);
  }

  void changePriority(TaskPriority? priority){
    form.selectedPriority = priority;
    notifyListeners();
  }
}
