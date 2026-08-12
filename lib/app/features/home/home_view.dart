import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/features/home/dialogs/create_or_edit_task_dialog/create_or_edit_task_dialog.dart';
import 'package:my_tasks_frontend/app/features/home/widgets/task_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CreateOrEditTaskDialog(),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: bodyContent(),
    );
  }

  Widget bodyContent() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => TaskCard(),
    );
  }
}
