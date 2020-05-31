// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'reticle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReticleStateTearOff {
  const _$ReticleStateTearOff();

  _ReticlerState call(
      {@nullable double top,
      @nullable double left,
      double size = 40,
      ReticleColor color = const ReticleColor.black()}) {
    return _ReticlerState(
      top: top,
      left: left,
      size: size,
      color: color,
    );
  }
}

// ignore: unused_element
const $ReticleState = _$ReticleStateTearOff();

mixin _$ReticleState {
  @nullable
  double get top;
  @nullable
  double get left;
  double get size;
  ReticleColor get color;

  $ReticleStateCopyWith<ReticleState> get copyWith;
}

abstract class $ReticleStateCopyWith<$Res> {
  factory $ReticleStateCopyWith(
          ReticleState value, $Res Function(ReticleState) then) =
      _$ReticleStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable double top,
      @nullable double left,
      double size,
      ReticleColor color});

  $ReticleColorCopyWith<$Res> get color;
}

class _$ReticleStateCopyWithImpl<$Res> implements $ReticleStateCopyWith<$Res> {
  _$ReticleStateCopyWithImpl(this._value, this._then);

  final ReticleState _value;
  // ignore: unused_field
  final $Res Function(ReticleState) _then;

  @override
  $Res call({
    Object top = freezed,
    Object left = freezed,
    Object size = freezed,
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      top: top == freezed ? _value.top : top as double,
      left: left == freezed ? _value.left : left as double,
      size: size == freezed ? _value.size : size as double,
      color: color == freezed ? _value.color : color as ReticleColor,
    ));
  }

  @override
  $ReticleColorCopyWith<$Res> get color {
    if (_value.color == null) {
      return null;
    }
    return $ReticleColorCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value));
    });
  }
}

abstract class _$ReticlerStateCopyWith<$Res>
    implements $ReticleStateCopyWith<$Res> {
  factory _$ReticlerStateCopyWith(
          _ReticlerState value, $Res Function(_ReticlerState) then) =
      __$ReticlerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable double top,
      @nullable double left,
      double size,
      ReticleColor color});

  @override
  $ReticleColorCopyWith<$Res> get color;
}

class __$ReticlerStateCopyWithImpl<$Res>
    extends _$ReticleStateCopyWithImpl<$Res>
    implements _$ReticlerStateCopyWith<$Res> {
  __$ReticlerStateCopyWithImpl(
      _ReticlerState _value, $Res Function(_ReticlerState) _then)
      : super(_value, (v) => _then(v as _ReticlerState));

  @override
  _ReticlerState get _value => super._value as _ReticlerState;

  @override
  $Res call({
    Object top = freezed,
    Object left = freezed,
    Object size = freezed,
    Object color = freezed,
  }) {
    return _then(_ReticlerState(
      top: top == freezed ? _value.top : top as double,
      left: left == freezed ? _value.left : left as double,
      size: size == freezed ? _value.size : size as double,
      color: color == freezed ? _value.color : color as ReticleColor,
    ));
  }
}

class _$_ReticlerState implements _ReticlerState {
  const _$_ReticlerState(
      {@nullable this.top,
      @nullable this.left,
      this.size = 40,
      this.color = const ReticleColor.black()})
      : assert(size != null),
        assert(color != null);

  @override
  @nullable
  final double top;
  @override
  @nullable
  final double left;
  @JsonKey(defaultValue: 40)
  @override
  final double size;
  @JsonKey(defaultValue: const ReticleColor.black())
  @override
  final ReticleColor color;

  @override
  String toString() {
    return 'ReticleState(top: $top, left: $left, size: $size, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReticlerState &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(color);

  @override
  _$ReticlerStateCopyWith<_ReticlerState> get copyWith =>
      __$ReticlerStateCopyWithImpl<_ReticlerState>(this, _$identity);
}

abstract class _ReticlerState implements ReticleState {
  const factory _ReticlerState(
      {@nullable double top,
      @nullable double left,
      double size,
      ReticleColor color}) = _$_ReticlerState;

  @override
  @nullable
  double get top;
  @override
  @nullable
  double get left;
  @override
  double get size;
  @override
  ReticleColor get color;
  @override
  _$ReticlerStateCopyWith<_ReticlerState> get copyWith;
}
