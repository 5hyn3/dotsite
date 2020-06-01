// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {@required String name,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize}) {
    return _Settings(
      name: name,
      cameraNumber: cameraNumber,
      reticleColor: reticleColor,
      reticleTop: reticleTop,
      reticleLeft: reticleLeft,
      reticleSize: reticleSize,
    );
  }
}

// ignore: unused_element
const $Settings = _$SettingsTearOff();

mixin _$Settings {
  String get name;
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

  $SettingsCopyWith<Settings> get copyWith;
}

abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize});

  $ReticleColorCopyWith<$Res> get reticleColor;
}

class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object name = freezed,
    Object cameraNumber = freezed,
    Object reticleColor = freezed,
    Object reticleTop = freezed,
    Object reticleLeft = freezed,
    Object reticleSize = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
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

abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize});

  @override
  $ReticleColorCopyWith<$Res> get reticleColor;
}

class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object name = freezed,
    Object cameraNumber = freezed,
    Object reticleColor = freezed,
    Object reticleTop = freezed,
    Object reticleLeft = freezed,
    Object reticleSize = freezed,
  }) {
    return _then(_Settings(
      name: name == freezed ? _value.name : name as String,
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

class _$_Settings implements _Settings {
  const _$_Settings(
      {@required this.name,
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
    return 'Settings(name: $name, cameraNumber: $cameraNumber, reticleColor: $reticleColor, reticleTop: $reticleTop, reticleLeft: $reticleLeft, reticleSize: $reticleSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
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
      const DeepCollectionEquality().hash(cameraNumber) ^
      const DeepCollectionEquality().hash(reticleColor) ^
      const DeepCollectionEquality().hash(reticleTop) ^
      const DeepCollectionEquality().hash(reticleLeft) ^
      const DeepCollectionEquality().hash(reticleSize);

  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {@required String name,
      @nullable int cameraNumber,
      @nullable ReticleColor reticleColor,
      @nullable double reticleTop,
      @nullable double reticleLeft,
      @nullable double reticleSize}) = _$_Settings;

  @override
  String get name;
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
  _$SettingsCopyWith<_Settings> get copyWith;
}
