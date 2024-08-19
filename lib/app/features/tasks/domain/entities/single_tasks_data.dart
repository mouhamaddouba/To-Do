class SingleTaskData {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  SingleTaskData({
    required this.id,
    required this.userId,
    required this.completed,
    required this.todo,
  });

  factory SingleTaskData.fromJson(
    Map<String, dynamic> encodedData,
  ) =>
      SingleTaskData(
        id: encodedData['id'],
        todo: encodedData['todo'],
        completed: encodedData['completed'],
        userId: encodedData['userId'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'todo': todo,
        'completed': completed,
        'userId': userId,
      };
}
