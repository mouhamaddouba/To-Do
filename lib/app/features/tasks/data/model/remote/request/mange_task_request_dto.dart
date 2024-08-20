class MangeTaskRequestDto {
  final String todo;
  final bool completed;

  MangeTaskRequestDto({
    required this.todo,
    required this.completed,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'completed': completed,
        'todo': todo,
      };
}
