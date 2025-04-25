import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.task) , label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.done) , label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive) , label: "Archive")
        ]),
        body: HomeViewBody() ,
      ),
    );
  }
}