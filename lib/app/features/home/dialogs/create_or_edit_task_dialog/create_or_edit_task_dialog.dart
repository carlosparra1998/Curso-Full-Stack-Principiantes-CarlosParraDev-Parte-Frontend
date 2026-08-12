import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/features/home/dialogs/create_or_edit_task_dialog/create_or_edit_task_controller.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';
import 'package:provider/provider.dart';

class CreateOrEditTaskDialog extends StatefulWidget {
  final List<TaskPriority> priorities;
  const CreateOrEditTaskDialog(this.priorities, {super.key});

  @override
  State<CreateOrEditTaskDialog> createState() => _CreateOrEditTaskDialogState();
}

class _CreateOrEditTaskDialogState extends State<CreateOrEditTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateOrEditTaskController(),
      child: Consumer<CreateOrEditTaskController>(
        builder: (_, provider, _) {
          bool enableCreation = provider.form.controller.text.trim().isNotEmpty;
          return AlertDialog(
          title: Text('Nueva tarea'),
          content: contentDialog(provider),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
              style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
            ),
            Opacity(
              opacity: enableCreation ? 1 : .5,
              child: FilledButton(
                onPressed: () async {
                  if(!enableCreation){
                    return;
                  }
                  final response = await provider.createOrEditTask(context);
                  if(response){
                    Navigator.pop(context);
                  }
                },
                child: const Text('Crear'),
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              ),
            ),
          ],
        );
        },
      ),
    );
  }

  Widget contentDialog(CreateOrEditTaskController provider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: provider.form.controller,
          decoration: const InputDecoration(
            labelText: 'Título de la tarea',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            provider.update();
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<TaskPriority>(
          value: provider.form.selectedPriority,
          items: widget.priorities
              .map(
                (priority) => DropdownMenuItem(
                  value: priority,
                  child: Text(priority.name),
                ),
              )
              .toList(),
          decoration: InputDecoration(
            labelText: 'Prioridad de la tarea',
            border: OutlineInputBorder(),
          ),
          onChanged: (priority) {
            provider.changePriority(priority);
          },
        ),
      ],
    );
  }
}
