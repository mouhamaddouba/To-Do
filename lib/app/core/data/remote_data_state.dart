import 'package:to_do/app/core/network_response/network_response.dart';

abstract class RemoteDataState<T> {
  final T data;
  final PagedList? pagedList;

  const RemoteDataState._({
    required this.data,
    this.pagedList,
  });

  factory RemoteDataState.done({
    required T data,
    PagedList? pagedList,
  }) = RemoteDoneState<T>;
}

class RemoteDoneState<T> extends RemoteDataState<T> {
  const RemoteDoneState({
    required super.data,
    super.pagedList,
  }) : super._();
}
