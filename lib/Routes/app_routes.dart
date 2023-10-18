import 'package:get/get.dart';
import 'package:todolist/Routes/routes.dart';
import 'package:todolist/Screens/home_screen.dart';
import 'package:todolist/Screens/to_do_list_screen.dart';

class AppRoutes {
  static final applicationRoutes = [
    GetPage(
        name: Routes.homeScreen,
        page: () => HomeScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.toDoListScreen,
        page: () => const ToDoListScreen(),
        transitionDuration: const Duration(milliseconds: 300),
        transition: Transition.leftToRight),
  ];
}
