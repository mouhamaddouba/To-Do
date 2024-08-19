class TasksRequestDto {
  final int limit;
  final int skip;

  TasksRequestDto({
    required this.limit,
    required this.skip,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'limit': limit,
        'skip': skip,
      };
}
