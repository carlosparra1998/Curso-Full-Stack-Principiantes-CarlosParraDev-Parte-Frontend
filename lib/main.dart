import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_tasks_frontend/app/app.dart';
import 'package:my_tasks_frontend/app/core/services/api_service.dart';
import 'package:my_tasks_frontend/app/providers/task_provider.dart';
import 'package:my_tasks_frontend/app/repositories/task_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        Provider(create: (ctx) => TaskRepository(ctx.read<ApiService>())),
        ChangeNotifierProvider(
          create: (ctx) => TaskProvider(ctx.read<TaskRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}
