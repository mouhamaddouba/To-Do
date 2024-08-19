class MangeTaskRequestDto {
  final String todo;
  final int completed;

  MangeTaskRequestDto({
    required this.todo,
    required this.completed,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completed': completed,
        'todo': todo,
      };
}
