// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingTearOff {
  const _$SettingTearOff();

  _Setting call(
      {@required String name,
      @nullable int id,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize}) {
    return _Setting(
      name: name,
      id: id,
      cameraNumber: cameraNumber,
      reticleColor: reticleColor,
      reticleTop: reticleTop,
      reticleLeft: reticleLeft,
      reticleSize: reticleSize,
    );
  }
}

// ignore: unused_element
const $Setting = _$SettingTearOff();

mixin _$Setting {
  String get name;
  @nullable
  int get id;
  @nullable
  int get cameraNumber;
  @nullable
  ReticleColor get reticleColor;
  @nullable
  double get reticleTop;
  @nullable
  double get reticleLeft;
  @nullable
  double get reticleSize;

  $SettingCopyWith<Setting> get copyWith;
}

abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @nullable int id,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize});

  $ReticleColorCopyWith<$Res> get reticleColor;
}

class _$SettingCopyWithImpl<$Res> implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  final Setting _value;
  // ignore: unused_field
  final $Res Function(Setting) _then;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object cameraNumber = freezed,
    Object reticleColor = freezed,
    Object reticleTop = freezed,
    Object reticleLeft = freezed,
    Object reticleSize = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as int,
      cameraNumber:
          cameraNumber == freezed ? _value.cameraNumber : cameraNumber as int,
      reticleColor: reticleColor == freezed
          ? _value.reticleColor
          : reticleColor as ReticleColor,
      reticleTop:
          reticleTop == freezed ? _value.reticleTop : reticleTop as double,
      reticleLeft:
          reticleLeft == freezed ? _value.reticleLeft : reticleLeft as double,
      reticleSize:
          reticleSize == freezed ? _value.reticleSize : reticleSize as double,
    ));
  }

  @override
  $ReticleColorCopyWith<$Res> get reticleColor {
    if (_value.reticleColor == null) {
      return null;
    }
    return $ReticleColorCopyWith<$Res>(_value.reticleColor, (value) {
      return _then(_value.copyWith(reticleColor: value));
    });
  }
}

abstract class _$SettingCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$SettingCopyWith(_Setting value, $Res Function(_Setting) then) =
      __$SettingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @nullable int id,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize});

  @override
  $ReticleColorCopyWith<$Res> get reticleColor;
}

class __$SettingCopyWithImpl<$Res> extends _$SettingCopyWithImpl<$Res>
    implements _$SettingCopyWith<$Res> {
  __$SettingCopyWithImpl(_Setting _value, $Res Function(_Setting) _then)
      : super(_value, (v) => _then(v as _Setting));

  @override
  _Setting get _value => super._value as _Setting;

  @override
  $Res call({
    Object name = freezed,
    Object id = freezed,
    Object cameraNumber = freezed,
    Object reticleColor = freezed,
    Object reticleTop = freezed,
    Object reticleLeft = freezed,
    Object reticleSize = freezed,
  }) {
    return _then(_Setting(
      name: name == freezed ? _value.name : name as String,
      id: id == freezed ? _value.id : id as int,
      cameraNumber:
          cameraNumber == freezed ? _value.cameraNumber : cameraNumber as int,
      reticleColor: reticleColor == freezed
          ? _value.reticleColor
          : reticleColor as ReticleColor,
      reticleTop:
          reticleTop == freezed ? _value.reticleTop : reticleTop as double,
      reticleLeft:
          reticleLeft == freezed ? _value.reticleLeft : reticleLeft as double,
      reticleSize:
          reticleSize == freezed ? _value.reticleSize : reticleSize as double,
    ));
  }
}

class _$_Setting implements _Setting {
  const _$_Setting(
      {@required this.name,
      @nullable this.id,
      @nullable this.cameraNumber,
      @nullable this.reticleColor,
      @nullable this.reticleTop,
      @nullable this.reticleLeft,
      @nullable this.reticleSize})
      : assert(name != null);

  @override
  final String name;
  @override
  @nullable
  final int id;
  @override
  @nullable
  final int cameraNumber;
  @override
  @nullable
  final ReticleColor reticleColor;
  @override
  @nullable
  final double reticleTop;
  @override
  @nullable
  final double reticleLeft;
  @override
  @nullable
  final double reticleSize;

  @override
  String toString() {
    return 'Setting(name: $name, id: $id, cameraNumber: $cameraNumber, reticleColor: $reticleColor, reticleTop: $reticleTop, reticleLeft: $reticleLeft, reticleSize: $reticleSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Setting &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.cameraNumber, cameraNumber) ||
                const DeepCollectionEquality()
                    .equals(other.cameraNumber, cameraNumber)) &&
            (identical(other.reticleColor, reticleColor) ||
                const DeepCollectionEquality()
                    .equals(other.reticleColor, reticleColor)) &&
            (identical(other.reticleTop, reticleTop) ||
                const DeepCollectionEquality()
                    .equals(other.reticleTop, reticleTop)) &&
            (identical(other.reticleLeft, reticleLeft) ||
                const DeepCollectionEquality()
                    .equals(other.reticleLeft, reticleLeft)) &&
            (identical(other.reticleSize, reticleSize) ||
                const DeepCollectionEquality()
                    .equals(other.reticleSize, reticleSize)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(cameraNumber) ^
      const DeepCollectionEquality().hash(reticleColor) ^
      const DeepCollectionEquality().hash(reticleTop) ^
      const DeepCollectionEquality().hash(reticleLeft) ^
      const DeepCollectionEquality().hash(reticleSize);

  @override
  _$SettingCopyWith<_Setting> get copyWith =>
      __$SettingCopyWithImpl<_Setting>(this, _$identity);
}

abstract class _Setting implements Setting {
  const factory _Setting(
      {@required String name,
      @nullable int id,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize}) = _$_Setting;

  @override
  String get name;
  @override
  @nullable
  int get id;
  @override
  @nullable
  int get cameraNumber;
  @override
  @nullable
  ReticleColor get reticleColor;
  @override
  @nullable
  double get reticleTop;
  @override
  @nullable
  double get reticleLeft;
  @override
  @nullable
  double get reticleSize;
  @override
  _$SettingCopyWith<_Setting> get copyWith;
}
