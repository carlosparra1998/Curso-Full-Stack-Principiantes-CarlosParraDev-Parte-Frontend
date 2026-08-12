import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/models/task_priority.dart';

class CreateOrEditTaskDialog extends StatefulWidget {
  final List<TaskPriority> priorities;
  const CreateOrEditTaskDialog(this.priorities, {super.key});

  @override
  State<CreateOrEditTaskDialog> createState() => _CreateOrEditTaskDialogState();
}

class _CreateOrEditTaskDialogState extends State<CreateOrEditTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva tarea'),
      content: contentDialog(),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
          style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
        ),
        FilledButton(
          onPressed: () async {},
          child: const Text('Crear'),
          style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
        ),
      ],
    );
  }

  Widget contentDialog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Título de la tarea',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<TaskPriority>(
          value: null,
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
          onChanged: (priority) {},
        ),
      ],
    );
  }
}
