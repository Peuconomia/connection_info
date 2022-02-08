library connection_info;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'models/connection_state.dart';

/// [ConnectionController] class is a controller class that provides
/// both a stream named [stream] and a future named [isConnected] for checking
/// the current state of the internet conenction
class ConnectionController {
  /// [serverUrl] represents the name of the server e.g. google.com.
  String serverUrl;

  /// [repeatInterval] represents the interval to check for connection
  /// periodically.
  Duration repeatInterval;

  /// [showErrorInDebugMode] flag is used for to show error message in debug mode
  /// or not.
  final bool showErrorInDebugMode;

  /// [_timer] is a timer that runs periodically for checking connection.
  Timer? _timer;

  /// [_controller] is the [StreamController] used for the stream.
  late final StreamController _controller;

  /// [stream] is the getter for the [_controller]'s [stream] instance.
  Stream get stream => _controller.stream;

  /// [_previousState] holds the previous connection state.
  ///
  /// We only update the connection information to the user only if current state
  /// does not match the previous state.
  ConnectionState? _previousState;

  /// This is the constructor.
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

  /// [isConnected] is the future that returns a [ConnectionState] object.
  ///
  /// It can be either true or false.
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

  /// [_setCurrentState] sets the new state.
  ///
  /// It sets [_previousState] only if [_previousState] is different from
  /// [newState] or if [_previousState] is null. Furthermore, it pushes to the
  /// stream as well if [_controller.hasListener] is true and [_controller.isClosed]
  /// is false and [_controller.isPaused] is false.
  void _setCurrentState(ConnectionState newState) {
    if (_previousState == null || newState != _previousState) {
      _previousState = newState;
      if (_controller.hasListener &&
          !_controller.isClosed &&
          !_controller.isPaused) {
        _controller.add(newState);
      }
    }
  }
}
