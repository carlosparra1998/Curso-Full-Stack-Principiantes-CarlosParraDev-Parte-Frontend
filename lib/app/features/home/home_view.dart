import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/features/home/dialogs/create_or_edit_task_dialog/create_or_edit_task_dialog.dart';
import 'package:my_tasks_frontend/app/features/home/widgets/task_card.dart';
import 'package:my_tasks_frontend/app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (_, provider, _) => Scaffold(
        appBar: AppBar(
          title: Text('My Tasks App', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CreateOrEditTaskDialog(provider.priorities),
            );
          },
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: bodyContent(provider),
      ),
    );
  }

  Widget bodyContent(TaskProvider provider) {
    return ListView.builder(
      itemCount: provider.tasks.length,
      itemBuilder: (context, index) =>
          TaskCard(provider.tasks[index], provider.priorities),
    );
  }
}
