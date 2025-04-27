import 'package:get_it/get_it.dart';
import 'package:todo_app/core/networking/database.dart';
import 'package:todo_app/features/home/data/repo/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupSeviceLocator() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(database: getIt.get<AppDatabase>()),
  );
}
