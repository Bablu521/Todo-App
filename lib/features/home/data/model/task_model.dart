class TaskModel {
  final int? id;
  final String title;
  final String date;
  final String time;
  final String status;

  TaskModel({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  Map <String, dynamic> toMap() {
    return {
      "id" : id,
      "title" : title,
      "date" : date,
      "time" : time,
      "status" : status
    };
  }

  factory TaskModel.fromMap(data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      date: data["date"],
      time: data["time"],
      status: data["status"],
    );
  }
}
