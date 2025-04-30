import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/helpers/pick_date_helper.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/presentation/views/components/custom_text_form_field.dart';

class UpdateModalBottomSheet extends StatefulWidget {
  final TaskModel task;
  const UpdateModalBottomSheet({super.key, required this.task});

  @override
  State<UpdateModalBottomSheet> createState() => _UpdateModalBottomSheetState();
}

class _UpdateModalBottomSheetState extends State<UpdateModalBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    dateController = TextEditingController(text: widget.task.date);
    timeController = TextEditingController(text: widget.task.time);
    selectedStatus = widget.task.status;
  }

  Future<void> updateTask() async {
    final updatedTask = TaskModel(
      id: widget.task.id,
      title: titleController.text,
      date: dateController.text,
      time: timeController.text,
      status: selectedStatus,
    );
    await getIt.get<DatabaseHelpher>().updateDatabase(task: updatedTask);
    context.read<AllTasksCubit>().getAllTasks();
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 150),
        height: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update Task",
                  style: AppStyles.style22.copyWith(color: Colors.black),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: CustomTextFormField(
                    controller: titleController,
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title),
                    readOnly: false,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: CustomTextFormField(
                    controller: dateController,
                    labelText: "Date",
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    readOnly: true,
                    onTap:
                        () => pickDate(
                          context: context,
                          dateController: dateController,
                        ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: CustomTextFormField(
                    controller: timeController,
                    labelText: "Time",
                    prefixIcon: Icon(Icons.access_time_outlined),
                    readOnly: true,
                    onTap:
                        () => pickDate(
                          context: context,
                          dateController: dateController,
                        ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    radioItem(value: "In Progress"),
                    radioItem(value: "Complete"),
                    radioItem(value: "Incomplete"),
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: updateTask,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.btnColor,
                    ),
                    child: Text(
                      "Update Task",
                      style: AppStyles.style18.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radioItem({required String value}) {
    return Column(
      children: [
        Radio(
          value: value,
          groupValue: selectedStatus,
          onChanged: (value) {
            setState(() {
              selectedStatus = value!;
            });
          },
        ),
        Text(value, style: AppStyles.style14),
      ],
    );
  }
}
