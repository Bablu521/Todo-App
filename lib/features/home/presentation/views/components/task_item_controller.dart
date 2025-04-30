import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/presentation/views/components/update_modal_bottom_sheet.dart';

class TaskItemController extends StatelessWidget {
  final TaskModel task;
  const TaskItemController({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) {
                    return UpdateModalBottomSheet(task: task);
                  },
                );
              },
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
          ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () async {
                await getIt.get<DatabaseHelpher>().deleteFromDatabase(
                  id: task.id!,
                );
                context.read<AllTasksCubit>().getAllTasks();
              },
              child: Container(
                alignment: Alignment.center,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.deleteColor, width: 1),
                ),
                child: Text(
                  "Delete",
                  style: AppStyles.style18.copyWith(
                    color: AppColors.deleteColor,
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
