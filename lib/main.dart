import 'package:flutter/material.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';
import 'package:todo_app/features/splash/presentation/views/splash_view.dart';

void main() {
  setupSeviceLocator();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {AppRouter.homeScreen: (context) => HomeView()},
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.blueBg,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
