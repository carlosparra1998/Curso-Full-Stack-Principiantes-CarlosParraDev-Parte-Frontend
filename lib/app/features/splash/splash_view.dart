import 'package:flutter/material.dart';
import 'package:my_tasks_frontend/app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<TaskProvider>().loadDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyContent());
  }

  Widget bodyContent() {
    return Center(child: CircularProgressIndicator());
  }
}
