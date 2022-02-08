library connection_info;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

@freezed
class ConnectionState with _$ConnectionState {
  factory ConnectionState({
    @Default(false) bool isConnected,
  }) = _ConnectionState;
}
