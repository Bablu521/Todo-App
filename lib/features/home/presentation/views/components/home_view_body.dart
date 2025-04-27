import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/presentation/views/components/tasks_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.app_registration_outlined, size: 32 ,color: Colors.black,),
                  SizedBox(width: 2),
                  Text("Tasks", style: AppStyles.style30),
                ],
              ),
            ),
          ),
          TasksListView(),
        ],
      ),
    );
  }
}
