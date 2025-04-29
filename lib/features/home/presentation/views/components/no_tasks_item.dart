import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/styles.dart';

class NoTasksItem extends StatelessWidget {
  final String taskType;
  const NoTasksItem({super.key , required this.taskType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.app_registration_outlined,
                  size: 32,
                  color: Colors.black,
                ),
                SizedBox(width: 2),
                Text(taskType, style: AppStyles.style30),
              ],
            ),
          ),
          Expanded(
            child: Center(child: Text("No Tasks", style: AppStyles.style22.copyWith(fontSize: 24))))
        ],
      ),
    );
  }
}
