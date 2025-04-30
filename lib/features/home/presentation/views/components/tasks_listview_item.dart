import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/presentation/views/components/task_item_controller_section.dart';
import 'package:todo_app/features/home/presentation/views/components/task_item_desc_section.dart';
import 'package:todo_app/features/home/presentation/views/components/task_item_details_section.dart';

class TasksListViewItem extends StatelessWidget {
  final TaskModel task;
  const TasksListViewItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(15),
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TaskItemDetailsSection(task: task),
              SizedBox(height: 10),
              TaskItemDescSection(task: task),
              SizedBox(height: 10),
              TaskItemControllerSection(task: task),
            ],
          ),
        ),
      ),
    );
  }
}
