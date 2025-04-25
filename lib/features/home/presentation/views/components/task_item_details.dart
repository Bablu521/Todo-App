import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';

class TaskItemDetails extends StatelessWidget {
  const TaskItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buy groceries",
                  style: AppStyles.style22,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 3),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text("25/4/2025", style: AppStyles.style14),
                      VerticalDivider(
                        thickness: 1.4,
                        width: 15,
                        color: Color.fromARGB(122, 37, 78, 86),
                        indent: 4, // Shortens from the top
                        endIndent: 4,
                      ),
                      Text("6:00 PM", style: AppStyles.style14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 3),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blueBg,
                ),
                padding: EdgeInsets.all(5),
                child: Text(
                  "Incomplete",
                  style: AppStyles.style14.copyWith(
                    color: Color.fromARGB(186, 47, 62, 63),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
