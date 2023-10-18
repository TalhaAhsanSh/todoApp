import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/Routes/app_routes.dart';
import 'package:todolist/Screens/home_screen.dart';

import 'Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        initialRoute: Routes.homeScreen,
        getPages: AppRoutes.applicationRoutes,
      ),
    );
  }
}
