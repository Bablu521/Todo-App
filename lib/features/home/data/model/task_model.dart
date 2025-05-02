class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String status;
  final String? imagePath;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.status,
    this.imagePath
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "date": date,
      "time": time,
      "status": status,
      "imagePath": imagePath
    };
  }

  factory TaskModel.fromMap(data) {
    return TaskModel(
      id: data["id"],
      title: data["title"],
      description : data["description"],
      date: data["date"],
      time: data["time"],
      status: data["status"],
      imagePath: data["imagePath"]
    );
  }
}
