import 'package:connection_info/connection.dart';
import 'package:connection_info/models/connection_state.dart';
import 'package:test/test.dart';

void main() {
  group('Connection Controller tests', () {
    test('send invalid server url and get error', () async {
      final controller = ConnectionController(
        serverUrl: 'http://asdom',
        repeatInterval: const Duration(seconds: 1),
      );

      expect(
          controller.stream,
          emitsInOrder(
            [ConnectionState(isConnected: false)],
          ));
    }, timeout: const Timeout(Duration(seconds: 2)));
  });
}
