import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';

class CreateOrEditTaskForm {
  TextEditingController controller = TextEditingController();

  TaskPriority? selectedPriority;

  CreateOrEditTaskForm.init(){
    controller = TextEditingController();
    selectedPriority = null;
  }
}