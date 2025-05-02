import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/helpers/pick_date_helper.dart';
import 'package:todo_app/core/helpers/pick_time_helper.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/custom_text_form_field.dart';

class UpdateModalBottomSheet extends StatefulWidget {
  final TaskModel task;
  const UpdateModalBottomSheet({super.key, required this.task});

  @override
  State<UpdateModalBottomSheet> createState() => _UpdateModalBottomSheetState();
}

class _UpdateModalBottomSheetState extends State<UpdateModalBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late String selectedStatus;
  late String? imagePath;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final returnedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      imagePath = (File(returnedImage.path)).path;
    }
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descController = TextEditingController(text: widget.task.description);
    dateController = TextEditingController(text: widget.task.date);
    timeController = TextEditingController(text: widget.task.time);
    selectedStatus = widget.task.status;
    imagePath = widget.task.imagePath;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();
  }

  Future<void> updateTask() async {
    final updatedTask = TaskModel(
      id: widget.task.id,
      title: titleController.text,
      description: descController.text,
      date: dateController.text,
      time: timeController.text,
      status: selectedStatus,
      imagePath: imagePath,
    );
    await getIt.get<DatabaseHelpher>().updateDatabase(task: updatedTask);
    context.read<AllTasksCubit>().getAllTasks();
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  height: 45,
                  child: CustomTextFormField(
                    controller: titleController,
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title ,
                      color: AppColors.greyColor,
                    ),
                    readOnly: false,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: CustomTextFormField(
                    controller: descController,
                    labelText: "Description",
                    prefixIcon: Icon(Icons.subject_outlined , color: AppColors.greyColor,
                    ),
                    readOnly: false,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: CustomTextFormField(
                    controller: dateController,
                    labelText: "Date",
                    prefixIcon: Icon(Icons.calendar_month_outlined ,
                      color: AppColors.greyColor,
                    ),
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
                  height: 45,
                  child: CustomTextFormField(
                    controller: timeController,
                    labelText: "Time",
                    prefixIcon: Icon(Icons.access_time_outlined , color: AppColors.greyColor,),
                    readOnly: true,
                    onTap:
                        () => pickTime(
                          context: context,
                          timeController: timeController,
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
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Upload Image",
                      style: AppStyles.style14.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyColor,
                      ),
                    ),
                    IconButton(
                      onPressed: pickImageFromGallery,
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 32,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
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
        Text(
          value,
          style: AppStyles.style14.copyWith(
            color: AppColors.greyColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
