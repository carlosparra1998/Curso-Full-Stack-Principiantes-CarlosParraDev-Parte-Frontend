import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_tasks_frontend/app/core/routes/route_helper.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tasks App',
      initialRoute: RouteHelper.homeView, //TODO
      getPages: RouteHelper.routes,
    );
  }
}
