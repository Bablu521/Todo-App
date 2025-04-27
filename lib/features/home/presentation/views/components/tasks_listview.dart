import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_cubit.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_state.dart';
import 'package:todo_app/features/home/presentation/views/components/tasks_listview_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTasksCubit, AllTasksState>(
      builder: (context, state) {
        if (state is AllTasksSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return TasksListViewItem(task: state.tasks[index]);
            },
            itemCount: state.tasks.length,
          );
        } else if (state is AllTasksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text("An Error Occured : ${state.errorMsg}")));
        } else if (state is AllTasksLoading) {
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else {
          return SliverToBoxAdapter(child: Center(child: SizedBox()));
        }
      },
    );
  }
}
