import 'package:flutter/material.dart';

class CreateOrEditTaskDialog extends StatefulWidget {
  const CreateOrEditTaskDialog({super.key});

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
          onPressed: () {},
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
      DropdownButtonFormField<String>(
        value: 'HIGH',
        items: [
          DropdownMenuItem(child: const Text('HIGH'), value: 'HIGH'),
          DropdownMenuItem(child: const Text('LOW'), value: 'LOW'),
        ],
        decoration: InputDecoration(
          labelText: 'Prioridad de la tarea',
          border: OutlineInputBorder(),
        ),
        onChanged: (priority) {},
      ),
    ],
  );
}
