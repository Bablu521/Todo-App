import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';

class TaskItemController extends StatelessWidget {
  const TaskItemController({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.updateColor, width: 1),
              ),
              child: Text("Update", style: AppStyles.style18),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.deleteColor, width: 1),
              ),
              child: Text(
                "Delete",
                style: AppStyles.style18.copyWith(color: AppColors.deleteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
