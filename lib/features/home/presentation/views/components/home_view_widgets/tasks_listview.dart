import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/tasks_listview_item.dart';

class TasksListView extends StatelessWidget {
  final List<TaskModel> tasks;
  const TasksListView({super.key,required this.tasks});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return TasksListViewItem(task: tasks[index]);
      },
      itemCount: tasks.length,
    );
  }
}
