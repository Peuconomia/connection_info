# connection_info


[![pub package](https://img.shields.io/pub/v/device_info_plus.svg)](https://pub.dev/packages/connection_info)





Get current internet conenction information from within the Flutter application.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |


# Sponshorship

If you like our work, please consider supporting us for coffees and future developments. You can 
sponsor us by clicking the below link to proceed.

<a href="https://www.buymeacoffee.com/ExpertKiD" target="_blank"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=ExpertKiD&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"></a>

# Usage

Import `package:connection_info/connection_info.dart`, instantiate `ConnectionController`
and listen to the stream for internet connection status or check directly using the `isConnected() async` 
method.

**Note:** `ConnectionState` will conflict with package `dart:async`, so we import connection state 
as follows:

```dart
import 'package:connection_info/models/connection_state.dart'
    as connection_state;
```

## 1. ConnectionController

The `ConnectionController` class has one constructor. By default, the serverUrl is set to 
`google.com`, `repeatInterval` to check for internet connection is set to 1 second and 
`showErrorInDebugMode` is set to `false`.

Syntax: 

```dart
ConnectionController(
    {String serverUrl = 'google.com',
    Duration repeatInterval = const Duration(seconds: 1),
    bool showErrorInDebugMode = false,
})
```

The `ConnectionController` has one public stream named `stream` that will return a `ConnectionState`
object both on data and error state. Similarly, we can use `Future<ConnectionState> isConnected() async`
method of `ConnectionController` class to check the current status of the internet.

The idea here is, we only want to know whether there is internet or not. Not, how internet is 
provided to us. So, we only check if there is internet or not at any given time periodically using 
`repeatInterval`.

## 2. ConnectionState

The `ConnectionState` is a wrapper around a `bool`. It returns the current state of the internet 
connection. At any time, it is either `true` or `false`.

Syntax:

```dart
ConnectionState(bool isConnected: false)
```

# Example

```dart
class NetworkConnectionTestScreen extends StatefulWidget {
  const NetworkConnectionTestScreen({Key? key}) : super(key: key);

  @override
  State<NetworkConnectionTestScreen> createState() =>
      _NetworkConnectionTestScreenState();
}

class _NetworkConnectionTestScreenState
    extends State<NetworkConnectionTestScreen> {
  StreamSubscription? connectionSubscription;

  bool _isConnected = true;
  @override
  void initState() {
    super.initState();

    ConnectionController _controller = ConnectionController(
      serverUrl: 'pub.dev',
      repeatInterval: const Duration(seconds: 1),
      showErrorInDebugMode: false,
    );

    connectionSubscription = _controller.stream.listen((event) {
      print(event.isConnected);

      if (event is connection_state.ConnectionState) {
        setState(() {
          _isConnected = event.isConnected;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectionSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Has Internet: $_isConnected')),
    );
  }
}
```
