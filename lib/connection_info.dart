library connection_info;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'models/connection_state.dart';

class ConnectionController {
  String serverUrl;
  Duration repeatInterval;
  final bool showErrorInDebugMode;
  Timer? _timer;

  late final StreamController _controller;

  Stream get stream => _controller.stream;

  ConnectionState? _previousState;

  ConnectionController({
    this.serverUrl = 'google.com',
    this.repeatInterval = const Duration(
      seconds: 5,
    ),
    this.showErrorInDebugMode = false,
  }) {
    _controller = StreamController<ConnectionState>.broadcast(
      onListen: () {
        _timer ??= Timer.periodic(repeatInterval, (timer) async {
          try {
            final lookupResult = await InternetAddress.lookup(serverUrl);

            if (lookupResult.isNotEmpty &&
                lookupResult[0].rawAddress.isNotEmpty) {
              _setCurrentState(ConnectionState(isConnected: true));
            }
          } catch (error, stacktrace) {
            _setCurrentState(ConnectionState(isConnected: false));
            if (showErrorInDebugMode) {
              if (kDebugMode) {
                print(error);
                print(stacktrace);
              }
            }
          }
        });
      },
      onCancel: () {
        _timer?.cancel();
      },
    );
  }

  Future<ConnectionState> isConnected() async {
    try {
      final lookupResult = await InternetAddress.lookup(serverUrl);

      if (lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty) {
        _setCurrentState(ConnectionState(isConnected: true));
      }
    } catch (error, stacktrace) {
      if (showErrorInDebugMode) {
        if (kDebugMode) {
          print(error);
          print(stacktrace);
        }
        _setCurrentState(ConnectionState(isConnected: false));
      }
    }
    return _previousState!;
  }

  void _setCurrentState(ConnectionState newState) {
    if (_previousState == null || newState != _previousState) {
      _previousState = newState;
      print(_previousState);
      if (_controller.hasListener &&
          !_controller.isClosed &&
          !_controller.isPaused) {
        _controller.add(newState);
      }
    }
  }
}
