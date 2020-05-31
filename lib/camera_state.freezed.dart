// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'camera_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CameraStateTearOff {
  const _$CameraStateTearOff();

  _CameraState call(
      {@nullable CameraController initializedController,
      int cameraNumber = 0,
      @nullable CameraError error}) {
    return _CameraState(
      initializedController: initializedController,
      cameraNumber: cameraNumber,
      error: error,
    );
  }
}

// ignore: unused_element
const $CameraState = _$CameraStateTearOff();

mixin _$CameraState {
  @nullable
  CameraController get initializedController;
  int get cameraNumber;
  @nullable
  CameraError get error;

  $CameraStateCopyWith<CameraState> get copyWith;
}

abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable CameraController initializedController,
      int cameraNumber,
      @nullable CameraError error});

  $CameraErrorCopyWith<$Res> get error;
}

class _$CameraStateCopyWithImpl<$Res> implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  final CameraState _value;
  // ignore: unused_field
  final $Res Function(CameraState) _then;

  @override
  $Res call({
    Object initializedController = freezed,
    Object cameraNumber = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      initializedController: initializedController == freezed
          ? _value.initializedController
          : initializedController as CameraController,
      cameraNumber:
          cameraNumber == freezed ? _value.cameraNumber : cameraNumber as int,
      error: error == freezed ? _value.error : error as CameraError,
    ));
  }

  @override
  $CameraErrorCopyWith<$Res> get error {
    if (_value.error == null) {
      return null;
    }
    return $CameraErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

abstract class _$CameraStateCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(
          _CameraState value, $Res Function(_CameraState) then) =
      __$CameraStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable CameraController initializedController,
      int cameraNumber,
      @nullable CameraError error});

  @override
  $CameraErrorCopyWith<$Res> get error;
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
    Object cameraNumber = freezed,
    Object error = freezed,
  }) {
    return _then(_CameraState(
      initializedController: initializedController == freezed
          ? _value.initializedController
          : initializedController as CameraController,
      cameraNumber:
          cameraNumber == freezed ? _value.cameraNumber : cameraNumber as int,
      error: error == freezed ? _value.error : error as CameraError,
    ));
  }
}

class _$_CameraState implements _CameraState {
  const _$_CameraState(
      {@nullable this.initializedController,
      this.cameraNumber = 0,
      @nullable this.error})
      : assert(cameraNumber != null);

  @override
  @nullable
  final CameraController initializedController;
  @JsonKey(defaultValue: 0)
  @override
  final int cameraNumber;
  @override
  @nullable
  final CameraError error;

  @override
  String toString() {
    return 'CameraState(initializedController: $initializedController, cameraNumber: $cameraNumber, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CameraState &&
            (identical(other.initializedController, initializedController) ||
                const DeepCollectionEquality().equals(
                    other.initializedController, initializedController)) &&
            (identical(other.cameraNumber, cameraNumber) ||
                const DeepCollectionEquality()
                    .equals(other.cameraNumber, cameraNumber)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initializedController) ^
      const DeepCollectionEquality().hash(cameraNumber) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$CameraStateCopyWith<_CameraState> get copyWith =>
      __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  const factory _CameraState(
      {@nullable CameraController initializedController,
      int cameraNumber,
      @nullable CameraError error}) = _$_CameraState;

  @override
  @nullable
  CameraController get initializedController;
  @override
  int get cameraNumber;
  @override
  @nullable
  CameraError get error;
  @override
  _$CameraStateCopyWith<_CameraState> get copyWith;
}
