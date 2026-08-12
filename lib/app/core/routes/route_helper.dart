import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_tasks_frontend/app/features/home/home_view.dart';
import 'package:my_tasks_frontend/app/features/splash/splash_view.dart';

class RouteHelper {
  static final String _splashView = '/';
  static final String _homeView = '/home';

  static String get splashView => _splashView;
  static String get homeView => _homeView;

  static List<GetPage> get routes => [
    GetPage(name: _splashView, page: () => const SplashView()),
    GetPage(name: _homeView, page: () => const HomeView()),
  ];
}
