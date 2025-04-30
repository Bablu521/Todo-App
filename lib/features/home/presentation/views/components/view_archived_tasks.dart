import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_body.dart';
import 'package:todo_app/features/home/presentation/views/components/no_tasks_item.dart';

class ViewArchivedTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const ViewArchivedTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final archivedTasks =
        tasks.where((task) => task.status == "Incomplete").toList();
    if (archivedTasks.isEmpty) {
      return NoTasksItem(taskType: "Archived Tasks");
    }
    return HomeViewBody(tasks: archivedTasks, taskType: "Archived Tasks");
  }
}