import 'package:get_it/get_it.dart';
import 'package:todo_app/core/networking/database.dart';

final getIt = GetIt.instance;

void setupSeviceLocator() {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}
