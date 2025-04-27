import 'package:dartz/dartz.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

abstract class HomeRepo {
  Future<Either<String , List<TaskModel>>> fetchAllTasks();
}
