library connection_info;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

/// A model class to determine the current state of the internet connectivity
///
/// [isConnected] gives the current status of internet connectivity.
@freezed
class ConnectionState with _$ConnectionState {
  factory ConnectionState({
    @Default(false) bool isConnected,
  }) = _ConnectionState;
}
