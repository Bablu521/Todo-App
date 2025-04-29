import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:todo_app/features/home/data/model/task_model.dart';

class DatabaseHelpher {
  Database? database;

  createDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = p.join(dbPath, "todo.db");
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        // print("Database Created");
        db.execute(
          "CREATE Table tasks(id INTEGER PRIMARY KEY ,title TEXT,date TEXT,time TEXT,status Text)",
        );
        // print("Table Created");
      },
      onOpen: (_) {
        // print("database opened");
      },
    );
  }

  // insertIntoDatabase({
  //   required String title,
  //   required String date,
  //   required String time,
  // }) {
  //   database!.rawInsert(
  //     "INSERT INTO tasks (title , date , time , status) Values ('$title' , '$date' , '$time' , 'Pending')",
  //   );
  // }

  Future<void> insertIntoDatabase({required TaskModel task}) async {
    await database!.insert(
      "tasks",
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<List<Map<String, dynamic>>> getData() async {
  //   return await database!.rawQuery("SELECT * FROM tasks");
  // }

  Future<List<Map<String, dynamic>>> getData() async {
    return await database!.query("tasks");
  }

  deleteFromDatabase({required int id}) async {
    return await database!.rawDelete("DELETE FROM tasks WHERE id = ?", [id]);
  }
}
