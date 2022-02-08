// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of connection_info;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConnectionStateTearOff {
  const _$ConnectionStateTearOff();

  _ConnectionState call({bool isConnected = false}) {
    return _ConnectionState(
      isConnected: isConnected,
    );
  }
}

/// @nodoc
const $ConnectionState = _$ConnectionStateTearOff();

/// @nodoc
mixin _$ConnectionState {
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res>;
  $Res call({bool isConnected});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  final ConnectionState _value;
  // ignore: unused_field
  final $Res Function(ConnectionState) _then;

  @override
  $Res call({
    Object? isConnected = freezed,
  }) {
    return _then(_value.copyWith(
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ConnectionStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$ConnectionStateCopyWith(
          _ConnectionState value, $Res Function(_ConnectionState) then) =
      __$ConnectionStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isConnected});
}

/// @nodoc
class __$ConnectionStateCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res>
    implements _$ConnectionStateCopyWith<$Res> {
  __$ConnectionStateCopyWithImpl(
      _ConnectionState _value, $Res Function(_ConnectionState) _then)
      : super(_value, (v) => _then(v as _ConnectionState));

  @override
  _ConnectionState get _value => super._value as _ConnectionState;

  @override
  $Res call({
    Object? isConnected = freezed,
  }) {
    return _then(_ConnectionState(
      isConnected: isConnected == freezed
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConnectionState implements _ConnectionState {
  _$_ConnectionState({this.isConnected = false});

  @JsonKey()
  @override
  final bool isConnected;

  @override
  String toString() {
    return 'ConnectionState(isConnected: $isConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConnectionState &&
            const DeepCollectionEquality()
                .equals(other.isConnected, isConnected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isConnected));

  @JsonKey(ignore: true)
  @override
  _$ConnectionStateCopyWith<_ConnectionState> get copyWith =>
      __$ConnectionStateCopyWithImpl<_ConnectionState>(this, _$identity);
}

abstract class _ConnectionState implements ConnectionState {
  factory _ConnectionState({bool isConnected}) = _$_ConnectionState;

  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$ConnectionStateCopyWith<_ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
