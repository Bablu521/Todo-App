import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/home_view_body.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/no_tasks_item.dart';

class ViewDoneTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const ViewDoneTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final doneTasks = tasks.where((task) => task.status == "Complete").toList();
    if (doneTasks.isEmpty) {
      return NoTasksItem(taskType: "Completed Tasks");
    }
    return HomeViewBody(tasks: doneTasks, taskType: "Completed Tasks");
  }
}