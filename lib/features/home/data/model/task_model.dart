class TaskModel {
  final int id;
  final String? title;
  final String? date;
  final String? time;
  final String status;

  TaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  factory TaskModel.fromJson(data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      date: data["date"],
      time: data["time"],
      status: data["status"],
    );
  }
}
