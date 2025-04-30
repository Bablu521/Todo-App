import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_body.dart';
import 'package:todo_app/features/home/presentation/views/components/no_tasks_item.dart';

class ViewTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const ViewTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final activeTasks =
        tasks
            .where(
              (task) => task.status == "To-Do" || task.status == "In Progress",
            )
            .toList();
    if (activeTasks.isEmpty) {
      return NoTasksItem(taskType: "Tasks");
    }
    return HomeViewBody(tasks: activeTasks, taskType: "Tasks");
  }
}
