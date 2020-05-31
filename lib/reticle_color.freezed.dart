// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'reticle_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReticleColorTearOff {
  const _$ReticleColorTearOff();

  _Black black() {
    return const _Black();
  }

  _White white() {
    return const _White();
  }
}

// ignore: unused_element
const $ReticleColor = _$ReticleColorTearOff();

mixin _$ReticleColor {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result black(),
    @required Result white(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result black(),
    Result white(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result black(_Black value),
    @required Result white(_White value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result black(_Black value),
    Result white(_White value),
    @required Result orElse(),
  });
}

abstract class $ReticleColorCopyWith<$Res> {
  factory $ReticleColorCopyWith(
          ReticleColor value, $Res Function(ReticleColor) then) =
      _$ReticleColorCopyWithImpl<$Res>;
}

class _$ReticleColorCopyWithImpl<$Res> implements $ReticleColorCopyWith<$Res> {
  _$ReticleColorCopyWithImpl(this._value, this._then);

  final ReticleColor _value;
  // ignore: unused_field
  final $Res Function(ReticleColor) _then;
}

abstract class _$BlackCopyWith<$Res> {
  factory _$BlackCopyWith(_Black value, $Res Function(_Black) then) =
      __$BlackCopyWithImpl<$Res>;
}

class __$BlackCopyWithImpl<$Res> extends _$ReticleColorCopyWithImpl<$Res>
    implements _$BlackCopyWith<$Res> {
  __$BlackCopyWithImpl(_Black _value, $Res Function(_Black) _then)
      : super(_value, (v) => _then(v as _Black));

  @override
  _Black get _value => super._value as _Black;
}

class _$_Black implements _Black {
  const _$_Black();

  @override
  String toString() {
    return 'ReticleColor.black()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Black);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result black(),
    @required Result white(),
  }) {
    assert(black != null);
    assert(white != null);
    return black();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result black(),
    Result white(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (black != null) {
      return black();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result black(_Black value),
    @required Result white(_White value),
  }) {
    assert(black != null);
    assert(white != null);
    return black(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result black(_Black value),
    Result white(_White value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (black != null) {
      return black(this);
    }
    return orElse();
  }
}

abstract class _Black implements ReticleColor {
  const factory _Black() = _$_Black;
}

abstract class _$WhiteCopyWith<$Res> {
  factory _$WhiteCopyWith(_White value, $Res Function(_White) then) =
      __$WhiteCopyWithImpl<$Res>;
}

class __$WhiteCopyWithImpl<$Res> extends _$ReticleColorCopyWithImpl<$Res>
    implements _$WhiteCopyWith<$Res> {
  __$WhiteCopyWithImpl(_White _value, $Res Function(_White) _then)
      : super(_value, (v) => _then(v as _White));

  @override
  _White get _value => super._value as _White;
}

class _$_White implements _White {
  const _$_White();

  @override
  String toString() {
    return 'ReticleColor.white()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _White);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result black(),
    @required Result white(),
  }) {
    assert(black != null);
    assert(white != null);
    return white();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result black(),
    Result white(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (white != null) {
      return white();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result black(_Black value),
    @required Result white(_White value),
  }) {
    assert(black != null);
    assert(white != null);
    return white(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result black(_Black value),
    Result white(_White value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (white != null) {
      return white(this);
    }
    return orElse();
  }
}

abstract class _White implements ReticleColor {
  const factory _White() = _$_White;
}
