import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/sevice_locator.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/data/repo/home_repo_impl.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/presentation/views/components/custom_text_form_field.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String title = '';
  String date = '';
  String time = '';

  @override
  void initState() {
    super.initState();
    // getIt.get<AppDatabase>().createDatabase();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    dateController.dispose();
    timeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
              builder: (modalContext) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 150),
                    height: 520,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 45,
                            child: CustomTextFormField(
                              controller: dateController,
                              labelText: "Date",
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 45,
                            child: CustomTextFormField(
                              controller: timeController,
                              labelText: "Time",
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              title = titleController.text;
                              date = dateController.text;
                              time = timeController.text;
                              // print("$title , $date , $time");
                              await getIt.get<AppDatabase>().insertIntoDatabase(
                                title: title,
                                date: date,
                                time: time,
                              );
                              await getIt.get<AppDatabase>().getData();
                              titleController.clear();
                              dateController.clear();
                              timeController.clear();

                              Navigator.maybePop(context);
                              context.read<AllTasksCubit>().getAllTasks();
                            },
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
                );
              },
            );
          },
          backgroundColor: AppColors.blueBg,
          shape: StadiumBorder(),
          child: Icon(Icons.edit, color: Color.fromARGB(255, 23, 107, 122)),
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
