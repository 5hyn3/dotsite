// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'pointer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PointerStateTearOff {
  const _$PointerStateTearOff();

  _PointerState call(
      {@nullable double top, @nullable double left, @nullable double size}) {
    return _PointerState(
      top: top,
      left: left,
      size: size,
    );
  }
}

// ignore: unused_element
const $PointerState = _$PointerStateTearOff();

mixin _$PointerState {
  @nullable
  double get top;
  @nullable
  double get left;
  @nullable
  double get size;

  $PointerStateCopyWith<PointerState> get copyWith;
}

abstract class $PointerStateCopyWith<$Res> {
  factory $PointerStateCopyWith(
          PointerState value, $Res Function(PointerState) then) =
      _$PointerStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable double top, @nullable double left, @nullable double size});
}

class _$PointerStateCopyWithImpl<$Res> implements $PointerStateCopyWith<$Res> {
  _$PointerStateCopyWithImpl(this._value, this._then);

  final PointerState _value;
  // ignore: unused_field
  final $Res Function(PointerState) _then;

  @override
  $Res call({
    Object top = freezed,
    Object left = freezed,
    Object size = freezed,
  }) {
    return _then(_value.copyWith(
      top: top == freezed ? _value.top : top as double,
      left: left == freezed ? _value.left : left as double,
      size: size == freezed ? _value.size : size as double,
    ));
  }
}

abstract class _$PointerStateCopyWith<$Res>
    implements $PointerStateCopyWith<$Res> {
  factory _$PointerStateCopyWith(
          _PointerState value, $Res Function(_PointerState) then) =
      __$PointerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable double top, @nullable double left, @nullable double size});
}

class __$PointerStateCopyWithImpl<$Res> extends _$PointerStateCopyWithImpl<$Res>
    implements _$PointerStateCopyWith<$Res> {
  __$PointerStateCopyWithImpl(
      _PointerState _value, $Res Function(_PointerState) _then)
      : super(_value, (v) => _then(v as _PointerState));

  @override
  _PointerState get _value => super._value as _PointerState;

  @override
  $Res call({
    Object top = freezed,
    Object left = freezed,
    Object size = freezed,
  }) {
    return _then(_PointerState(
      top: top == freezed ? _value.top : top as double,
      left: left == freezed ? _value.left : left as double,
      size: size == freezed ? _value.size : size as double,
    ));
  }
}

class _$_PointerState implements _PointerState {
  const _$_PointerState(
      {@nullable this.top, @nullable this.left, @nullable this.size});

  @override
  @nullable
  final double top;
  @override
  @nullable
  final double left;
  @override
  @nullable
  final double size;

  @override
  String toString() {
    return 'PointerState(top: $top, left: $left, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PointerState &&
            (identical(other.top, top) ||
                const DeepCollectionEquality().equals(other.top, top)) &&
            (identical(other.left, left) ||
                const DeepCollectionEquality().equals(other.left, left)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(top) ^
      const DeepCollectionEquality().hash(left) ^
      const DeepCollectionEquality().hash(size);

  @override
  _$PointerStateCopyWith<_PointerState> get copyWith =>
      __$PointerStateCopyWithImpl<_PointerState>(this, _$identity);
}

abstract class _PointerState implements PointerState {
  const factory _PointerState(
      {@nullable double top,
      @nullable double left,
      @nullable double size}) = _$_PointerState;

  @override
  @nullable
  double get top;
  @override
  @nullable
  double get left;
  @override
  @nullable
  double get size;
  @override
  _$PointerStateCopyWith<_PointerState> get copyWith;
}
