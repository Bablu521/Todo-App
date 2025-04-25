import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.blueBg
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
