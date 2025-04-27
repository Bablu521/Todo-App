import 'package:todo_app/features/home/data/model/task_model.dart';

abstract class AllTasksState {}

final class AllTasksInitial extends AllTasksState {}

final class AllTasksLoading extends AllTasksState {}

final class AllTasksSuccess extends AllTasksState {
  final List<TaskModel> tasks;
  
  AllTasksSuccess({required this.tasks});
}

final class AllTasksFailure extends AllTasksState {
  final String errorMsg;

  AllTasksFailure({required this.errorMsg});
}
