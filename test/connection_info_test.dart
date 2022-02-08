import 'package:connection_info/connection.dart';
import 'package:connection_info/models/connection_state.dart';
import 'package:test/test.dart';

void main() {
  group('Connection Controller tests', () {
    test('send invalid server url and get isConnected false', () async {
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

    test('send valid server url and get isConnected true', () async {
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
  });
}
