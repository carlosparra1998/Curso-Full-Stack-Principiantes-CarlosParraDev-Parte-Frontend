import 'package:flutter/material.dart';

class SureDialog extends StatefulWidget {
  const SureDialog({super.key});

  @override
  State<SureDialog> createState() => _SureDialog();
}

class _SureDialog extends State<SureDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Borrar tarea'),
      content: contentDialog(),
      actions: [
        TextButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
          child: const Text('Borrar'),
        ),
      ],
    );
  }

  Widget contentDialog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text('¿Estás seguro de que quieres borrar esta tarea?')],
    );
  }
}
