import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class AppNetworkUtils {
  Future<bool> get isConnected;
}

class AppNetworkUtilsImpl implements AppNetworkUtils {
  static final instance = Get.find<AppNetworkUtilsImpl>();

  AppNetworkUtilsImpl._();

  static void init() {
    Get.lazyPut(
      () => AppNetworkUtilsImpl._(),
    );
  }

  @override
  Future<bool> get isConnected {
    return NetworkConnectivity.instance.isConnected();
  }
}

class NetworkConnectivity {
  // [TODO]: Make this domain related to backend
  static const String _lookupDomain = 'example.com';

  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();

    _checkStatus(result);

    _networkConnectivity.onConnectivityChanged.listen(
      (result) {
        _checkStatus(result);
      },
    );
  }

  Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup(_lookupDomain);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }

  // I we want to observe from UI
  void _checkStatus(
    ConnectivityResult result,
  ) async {
    bool isOnline = false;

    try {
      isOnline = await isConnected();
    } on SocketException catch (_) {
      isOnline = false;
    }

    _controller.sink.add(
      {
        result: isOnline,
      },
    );
  }

  void disposeStream() => _controller.close();
}
