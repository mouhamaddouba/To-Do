class MangeTaskRequestDto {
  final String todo;
  final bool completed;
  final int userId;

  MangeTaskRequestDto({
    required this.todo,
    required this.completed,
    required this.userId,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completed': completed,
        'todo': todo,
        'userId': userId,
      };
}
