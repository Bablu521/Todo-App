import 'package:flutter/material.dart';
import 'package:todo_app/features/home/presentation/views/components/tasks_listview_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return TasksListViewItem();
      },
      itemCount: 10,
    );
  }
}
