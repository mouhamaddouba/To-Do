import 'dart:convert';

class NetworkResponse<T> {
  final bool succeeded;
  final String key;
  final String message;
  final PagedList? pagedList;
  final T? data;
  final List<T>? dataList;

  NetworkResponse({
    required this.succeeded,
    required this.key,
    required this.message,
    required this.pagedList,
    required this.data,
    required this.dataList,
  });

  static NetworkResponse<T> fromJson<T>(
    Map<String, dynamic> json, [
    T Function(Map<String, dynamic> json)? fromJsonT,
  ]) =>
      NetworkResponse(
        succeeded: json['succeeded'],
        key: json['key'] ?? '',
        message: json['message'] ?? '',
        pagedList: json['pagedList'] == null
            ? null
            : PagedList.fromJson(
                json['pagedList'],
              ),
        data: _getData<T>(
          json,
          fromJsonT,
        ),
        dataList: _getDataList<T>(
          json,
          fromJsonT,
        ),
      );

  static T? _getData<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    if (fromJsonT == null) {
      return null;
    }

    if (json['data'] == null) {
      return null;
    }

    if (json['data'] is Map) {
      return fromJsonT(
        json['data'],
      );
    }

    return null;
  }

  static List<T>? _getDataList<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json)? fromJsonT,
  ) {
    if (fromJsonT == null) {
      return null;
    }

    if (json['data'] == null) {
      return null;
    }

    if (json['data'] is List) {
      return (json['data'] as List)
          .map(
            (element) => fromJsonT(
              element,
            ),
          )
          .toList();
    }

    // for data in data list
    else if (json['data']['dataList'] is List) {
      return (json['data']['dataList'] as List)
          .map(
            (element) => fromJsonT(
              element,
            ),
          )
          .toList();
    }

    return null;
  }
}

class PagedList {
  final int totalRecords;
  final int pageSize;
  final int pageNumber;
  final int firstPage;
  final int lastPage;
  final int previousPage;
  final int nextPage;
  final int totalPages;
  final int firstItem;
  final int lastItem;
  final bool withPaging;

  PagedList({
    required this.totalRecords,
    required this.pageSize,
    required this.pageNumber,
    required this.firstPage,
    required this.lastPage,
    required this.previousPage,
    required this.nextPage,
    required this.totalPages,
    required this.firstItem,
    required this.lastItem,
    required this.withPaging,
  });

  factory PagedList.defaultObj() => PagedList(
        totalRecords: -1,
        pageSize: 4,
        pageNumber: 1,
        firstPage: -1,
        lastPage: -1,
        previousPage: -1,
        nextPage: -1,
        totalPages: -1,
        firstItem: -1,
        lastItem: -1,
        withPaging: true,
      );

  PagedList copyWith({
    int? pageSize,
    int? pageNumber,
    bool? withPaging,
  }) =>
      PagedList(
        totalRecords: -totalRecords,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        firstPage: firstPage,
        lastPage: lastPage,
        previousPage: previousPage,
        nextPage: nextPage,
        totalPages: totalPages,
        firstItem: firstItem,
        lastItem: lastItem,
        withPaging: withPaging ?? this.withPaging,
      );

  factory PagedList.fromJson(
    Map<String, dynamic> json,
  ) =>
      PagedList(
        totalRecords: json['totalRecords'],
        pageSize: json['pageSize'],
        pageNumber: json['pageNumber'],
        firstPage: json['firstPage'],
        lastPage: json['lastPage'],
        previousPage: json['previousPage'],
        nextPage: json['nextPage'],
        totalPages: json['totalPages'],
        firstItem: json['firstItem'],
        lastItem: json['lastItem'],
        withPaging: json['withPaging'],
      );

  Map<String, dynamic> toJson() => {
        'totalRecords': totalRecords,
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'firstPage': firstPage,
        'lastPage': lastPage,
        'previousPage': previousPage,
        'nextPage': nextPage,
        'totalPages': totalPages,
        'firstItem': firstItem,
        'lastItem': lastItem,
        'withPaging': withPaging,
      };

  @override
  String toString() => jsonEncode(
        toJson(),
      );
}
