import 'package:flutter/material.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

class TaskItemDescSection extends StatelessWidget {
  final TaskModel task;
  const TaskItemDescSection({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              task.description,
              style: AppStyles.style14.copyWith(
                color: Color.fromARGB(186, 47, 62, 63),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 2),
          Container(
            decoration: BoxDecoration(
              color: AppColors.blueBg,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.taskDetailsScreen);
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.btnColor,
                size: 22.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
