import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/data/repo/home_repo.dart';
import 'package:todo_app/features/home/logic/cubit/all_tasks_state.dart';

class AllTasksCubit extends Cubit<AllTasksState> {
  final HomeRepo homeRepo;
  AllTasksCubit({required this.homeRepo}) : super(AllTasksInitial());

  getAllTasks() async {
    emit(AllTasksLoading());
    var result = await homeRepo.fetchAllTasks();
    result.fold(
      (error) {
        emit(AllTasksFailure(errorMsg: error));
      },
      (tasks) {
        emit(AllTasksSuccess(tasks: tasks));
      },
    );
  }
}
