// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CameraStateTearOff {
  const _$CameraStateTearOff();

  _CameraState call({CameraController initializedController}) {
    return _CameraState(
      initializedController: initializedController,
    );
  }
}

// ignore: unused_element
const $CameraState = _$CameraStateTearOff();

mixin _$CameraState {
  CameraController get initializedController;

  $CameraStateCopyWith<CameraState> get copyWith;
}

abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res>;
  $Res call({CameraController initializedController});
}

class _$CameraStateCopyWithImpl<$Res> implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  final CameraState _value;
  // ignore: unused_field
  final $Res Function(CameraState) _then;

  @override
  $Res call({
    Object initializedController = freezed,
  }) {
    return _then(_value.copyWith(
      initializedController: initializedController == freezed
          ? _value.initializedController
          : initializedController as CameraController,
    ));
  }
}

abstract class _$CameraStateCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(
          _CameraState value, $Res Function(_CameraState) then) =
      __$CameraStateCopyWithImpl<$Res>;
  @override
  $Res call({CameraController initializedController});
}

class __$CameraStateCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(
      _CameraState _value, $Res Function(_CameraState) _then)
      : super(_value, (v) => _then(v as _CameraState));

  @override
  _CameraState get _value => super._value as _CameraState;

  @override
  $Res call({
    Object initializedController = freezed,
  }) {
    return _then(_CameraState(
      initializedController: initializedController == freezed
          ? _value.initializedController
          : initializedController as CameraController,
    ));
  }
}

class _$_CameraState implements _CameraState {
  const _$_CameraState({this.initializedController});

  @override
  final CameraController initializedController;

  @override
  String toString() {
    return 'CameraState(initializedController: $initializedController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CameraState &&
            (identical(other.initializedController, initializedController) ||
                const DeepCollectionEquality().equals(
                    other.initializedController, initializedController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initializedController);

  @override
  _$CameraStateCopyWith<_CameraState> get copyWith =>
      __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  const factory _CameraState({CameraController initializedController}) =
      _$_CameraState;

  @override
  CameraController get initializedController;
  @override
  _$CameraStateCopyWith<_CameraState> get copyWith;
}
