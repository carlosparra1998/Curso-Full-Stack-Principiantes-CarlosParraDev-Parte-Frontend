import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

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
            Checkbox(value: true, onChanged: (status) {}),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mi tarea',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Prioridad HIGH',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () async {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
