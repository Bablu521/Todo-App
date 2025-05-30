import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/helpers/pick_time_helper.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/helpers/pick_date_helper.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_state.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/custom_text_form_field.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/view_archived_tasks.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/view_done_tasks.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_widgets/view_tasks.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final String title = '';
  final String description = '';
  final String date = '';
  final String time = '';

  File? imagePath;
  final ImagePicker imagePicker = ImagePicker();

    Future<void> pickImageFromGallery() async {
    final returnedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      imagePath = File(returnedImage.path);
    }
  }

  @override
  void initState() {
    super.initState();
    getIt.get<DatabaseHelpher>().createDatabase().then((_) {
      context.read<AllTasksCubit>().getAllTasks();
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
    dateController.dispose();
    timeController.dispose();
  }

  Future<void> addTask() async {
    if (titleController.text.isNotEmpty &&
        descController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      TaskModel newTask = TaskModel(
        title: titleController.text,
        description: descController.text,
        date: dateController.text,
        time: timeController.text,
        status: "To-Do",
        imagePath: imagePath?.path,
      );
      await getIt.get<DatabaseHelpher>().insertIntoDatabase(task: newTask);

      titleController.clear();
      descController.clear();
      dateController.clear();
      timeController.clear();
      imagePath = null;

      context.read<AllTasksCubit>().getAllTasks();
      Navigator.maybePop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all the task details.'),
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: AppColors.btnColor,
          unselectedItemColor: Colors.grey,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              label: "Done",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: "Archive",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 150),
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
                              "Add New Task",
                              style: AppStyles.style22.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 45,
                              child: CustomTextFormField(
                                controller: titleController,
                                labelText: "Title",
                                prefixIcon: Icon(Icons.title,color: AppColors.greyColor,),
                                readOnly: false,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 80,
                              child: CustomTextFormField(
                                controller: descController,
                                labelText: "Description",
                                prefixIcon: Icon(Icons.subject_outlined,
                                  color: AppColors.greyColor,
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
                                prefixIcon: Icon(Icons.calendar_month_outlined,
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
                                prefixIcon: Icon(Icons.access_time_outlined,
                                  color: AppColors.greyColor,
                                ),
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
                              onTap: addTask,
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.btnColor,
                                ),
                                child: Text(
                                  "Add Task",
                                  style: AppStyles.style18.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: AppColors.blueBg,
          shape: StadiumBorder(),
          child: Icon(Icons.edit, color: Color.fromARGB(255, 23, 107, 122)),
        ),
        body: BlocBuilder<AllTasksCubit, AllTasksState>(
          builder: (context, state) {
            if (state is AllTasksSuccess) {
              List<Widget> views = [
                ViewTasks(tasks: state.tasks),
                ViewDoneTasks(tasks: state.tasks),
                ViewArchivedTasks(tasks: state.tasks),
              ];
              return views[currentIndex];
            } else if (state is AllTasksFailure) {
              return Center(
                child: Text("An Error Occured : ${state.errorMsg}"),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
