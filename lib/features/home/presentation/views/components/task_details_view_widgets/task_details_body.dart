import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

class TaskDetailsBody extends StatelessWidget {
  final TaskModel task;
  const TaskDetailsBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Task Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          task.imagePath != null
                              ? FileImage(File(task.imagePath!))
                              : AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.title,
                          style: AppStyles.style30.copyWith(
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              task.status == "To-Do"
                                  ? Colors.grey[200]
                                  : task.status == "In Progress"
                                  ? Colors.yellow[100]
                                  : task.status == "Complete"
                                  ? Colors.green[100]
                                  : Colors.red[100],
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          task.status,
                          style: AppStyles.style14.copyWith(
                            color: Color.fromARGB(186, 47, 62, 63),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 8),
                      Text(
                        task.date,
                        style: AppStyles.style14.copyWith(
                          color: AppColors.greyColor,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 8),
                      Text(
                        task.time,
                        style: AppStyles.style14.copyWith(
                          color: AppColors.greyColor,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    task.description,
                    style: AppStyles.style22.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TaskDetailsBody extends StatelessWidget {
//   final TaskModel task;
//   const TaskDetailsBody({super.key, required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           elevation: 5,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image:
//                           task.imagePath != null
//                               ? DecorationImage(
//                                 image: FileImage(File(task.imagePath!)),
//                                 fit: BoxFit.fill,
//                               )
//                               : DecorationImage(
//                                 image: AssetImage("assets/images/logo.png"),
//                                 fit: BoxFit.fill,
//                               ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Center(
//                   child: Text(
//                     task.title,
//                     style: AppStyles.style30.copyWith(
//                       color: AppColors.btnColor,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   task.description,
//                   style: AppStyles.style22.copyWith(
//                     color: AppColors.greyColor,
//                     fontWeight: FontWeight.w900,
//                   ),
//                   softWrap: true,
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Icon(Icons.info_outline, size: 20,
//                       color: AppColors.greyColor,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       "Status: ${task.status}",
//                       style: AppStyles.style22.copyWith(
//                         color: AppColors.greyColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.calendar_today,
//                       size: 18,
//                       color: AppColors.greyColor,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       "Date: ${task.date}",
//                       style: AppStyles.style18.copyWith(
//                         color: AppColors.greyColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       size: 18,
//                       color: AppColors.greyColor,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       "Time: ${task.time}",
//                       style: AppStyles.style18.copyWith(
//                         color: AppColors.greyColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
