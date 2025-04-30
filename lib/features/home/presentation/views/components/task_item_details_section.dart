import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

class TaskItemDetailsSection extends StatelessWidget {
  final TaskModel task;
  const TaskItemDetailsSection({super.key , required this.task});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/logo.png")),
                shape: BoxShape.circle,
              ),
            )),
            SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: AppStyles.style22,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 3),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(task.date, style: AppStyles.style14),
                      VerticalDivider(
                        thickness: 1.4,
                        width: 15,
                        color: Color.fromARGB(122, 37, 78, 86),
                        indent: 4, // Shortens from the top
                        endIndent: 4,
                      ),
                      Text(task.time, style: AppStyles.style14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.blueBg,
              ),
              padding: EdgeInsets.all(5),
              child: Text(
                task.status,
                style: AppStyles.style14.copyWith(
                  color: Color.fromARGB(186, 47, 62, 63),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
