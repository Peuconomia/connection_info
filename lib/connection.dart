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
    this.serverUrl = 'https://google.com',
    this.repeatInterval = const Duration(
      seconds: 5,
    ),
    this.showErrorInDebugMode = false,
  }) {
    _controller = StreamController<ConnectionState>.broadcast(
      onListen: () {
        _timer ??= Timer.periodic(repeatInterval, (timer) async {
          try {
            var lookup = await InternetAddress.lookup(serverUrl);

            print(lookup);
            _setCurrentState(ConnectionState(isConnected: true));
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

  void _setCurrentState(ConnectionState newState) {
    if (_previousState == null || newState != _previousState) {
      _previousState = newState;
      _controller.add(newState);
    }
  }
}
