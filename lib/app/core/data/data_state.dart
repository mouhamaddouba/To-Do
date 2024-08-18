import 'package:to_do/app/core/error/export_error.dart';
import 'package:to_do/app/core/network_response/network_response.dart';

abstract class DataState<T> {
  final T data;
  final PagedList? pagedList;
  final Failure? failure;

  const DataState._({
    required this.data,
    this.pagedList,
    this.failure,
  });

  factory DataState.done({
    required T data,
    PagedList? pagedList,
    Failure? failure,
  }) = DoneState<T>;

  factory DataState.loading({
    required T data,
  }) = LoadingState<T>;
}

class DoneState<T> extends DataState<T> {
  const DoneState({
    required super.data,
    super.pagedList,
    super.failure,
  }) : super._();
}

class LoadingState<T> extends DataState<T> {
  const LoadingState({
    required super.data,
  }) : super._();
}
