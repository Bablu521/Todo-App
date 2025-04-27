import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/task_item_controller.dart';
import 'package:todo_app/features/home/presentation/views/components/task_item_details.dart';

class TasksListViewItem extends StatelessWidget {
  final TaskModel task;
  const TasksListViewItem({super.key , required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TaskItemDetails(task:task),
            SizedBox(height: 10),
            TaskItemController(task:task),
          ],
        ),
      ),
    );
  }
}
