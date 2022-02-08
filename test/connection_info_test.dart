import 'package:connection_info/connection_info.dart';
import 'package:connection_info/models/connection_state.dart';
import 'package:test/test.dart';

void main() {
  group('Connection Controller tests', () {
    test('STREAM: send invalid server url and get isConnected false', () async {
      final controller = ConnectionController(
        serverUrl: 'asdom',
        repeatInterval: const Duration(seconds: 1),
        showErrorInDebugMode: true,
      );

      expect(
          controller.stream,
          emitsInOrder(
            [ConnectionState(isConnected: false)],
          ));
    }, timeout: const Timeout(Duration(seconds: 2)));

    test('STREAM: send valid server url and get isConnected true', () async {
      final controller = ConnectionController(
        serverUrl: 'google.com',
        repeatInterval: const Duration(seconds: 1),
        showErrorInDebugMode: true,
      );

      expect(
          controller.stream,
          emitsInOrder(
            [ConnectionState(isConnected: true)],
          ));
    }, timeout: const Timeout(Duration(seconds: 2)));

    test('ASYNC: send valid server url and get isConnected true', () async {
      final controller = ConnectionController(
        serverUrl: 'facebook.com',
        showErrorInDebugMode: true,
      );

      final connectionState = await controller.isConnected();

      expect(connectionState, ConnectionState(isConnected: true),
          reason: "User must be connected to the internet in this case");
    }, timeout: const Timeout(Duration(seconds: 2)));

    test('ASYNC: send valid server url and get isConnected true', () async {
      final controller = ConnectionController(
        serverUrl: 'asdf',
        showErrorInDebugMode: true,
      );

      final connectionState = await controller.isConnected();

      expect(connectionState, ConnectionState(isConnected: false),
          reason: "User must be connected to the internet in this case");
    }, timeout: const Timeout(Duration(seconds: 2)));
  });
}
