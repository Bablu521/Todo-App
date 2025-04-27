import 'package:dartz/dartz.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final AppDatabase database;
  HomeRepoImpl({required this.database});
  @override
  Future<Either<String, List<TaskModel>>> fetchAllTasks() async {
    try {
      var data = await database.getData();
      List<TaskModel> tasks = [];
      for (var item in data) {
        tasks.add(TaskModel.fromJson(item));
      }
      return right(tasks);
    } catch (e) {
      return left(e.toString());
    }
  }
}
