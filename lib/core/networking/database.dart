import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? database;
  createDatabase() async {
    database = await openDatabase(
      "todo.db",
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

  insertIntoDatabase({
    required String title,
    required String date,
    required String time,
  }) {
    database!.rawInsert(
      "INSERT INTO tasks (title , date , time , status) Values ('$title' , '$date' , '$time' , 'Pending')",
    );
    // .then((id) {
    //   print("${id} inserted Successfully");
    // });
  }

  // Future<List<Map<String, dynamic>>> getData() async {
  //   return await database!.rawQuery("SELECT * FROM tasks");
  // }
  Future<List<Map<String, dynamic>>> getData() {
    return database!.rawQuery("SELECT * FROM tasks").then((tasks) {
      return tasks;
    });
  }

  deleteFromDatabase({required int id}) async {
    return await database!.rawDelete("DELETE FROM tasks WHERE id = ?",
        [id]);
  }
}
