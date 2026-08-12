import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/features/home/dialogs/create_or_edit_task_dialog/create_or_edit_task_dialog.dart';
import 'package:my_tasks_frontend/app/models/task.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';
import 'package:my_tasks_frontend/app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final List<TaskPriority> priorities;
  const TaskCard(this.task, this.priorities, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(
              value: task.isComplete,
              onChanged: (status) {
                context.read<TaskProvider>().markOrDismarkCompletitionTask(
                  task,
                  status ?? false,
                );
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.priority == null
                        ? 'Sin prioridad asignada'
                        : 'Prioridad ${task.priority!.name}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: task.priority == null
                          ? null
                          : task.priority!.order == 1
                          ? Colors.red
                          : task.priority!.order == 2
                          ? Colors.orange
                          : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) =>
                      CreateOrEditTaskDialog(priorities, editableTask: task),
                );
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
