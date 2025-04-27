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
    database!
        .rawInsert(
          "INSERT INTO tasks (title , date , time , status) Values ('$title' , '$date' , '$time' , 'Pending')",
        )
        .then((id) {
          // print("${id} inserted Successfully");
        });
  }

  getData() {
    database!.rawQuery("SELECT * FROM tasks").then((tasks) {
      return tasks;
    });
  }
}
