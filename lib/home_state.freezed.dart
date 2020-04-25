// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {int page = 0,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      @nullable AnimationController animationControllerB,
      @nullable Animation<Offset> animationOffsetB}) {
    return _HomeState(
      page: page,
      animationController: animationController,
      animationOffset: animationOffset,
      animationControllerB: animationControllerB,
      animationOffsetB: animationOffsetB,
    );
  }
}

// ignore: unused_element
const $HomeState = _$HomeStateTearOff();

mixin _$HomeState {
  int get page;
  @nullable
  AnimationController get animationController;
  @nullable
  Animation<Offset> get animationOffset;
  @nullable
  AnimationController get animationControllerB;
  @nullable
  Animation<Offset> get animationOffsetB;

  $HomeStateCopyWith<HomeState> get copyWith;
}

abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {int page,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      @nullable AnimationController animationControllerB,
      @nullable Animation<Offset> animationOffsetB});
}

class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object page = freezed,
    Object animationController = freezed,
    Object animationOffset = freezed,
    Object animationControllerB = freezed,
    Object animationOffsetB = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController as AnimationController,
      animationOffset: animationOffset == freezed
          ? _value.animationOffset
          : animationOffset as Animation<Offset>,
      animationControllerB: animationControllerB == freezed
          ? _value.animationControllerB
          : animationControllerB as AnimationController,
      animationOffsetB: animationOffsetB == freezed
          ? _value.animationOffsetB
          : animationOffsetB as Animation<Offset>,
    ));
  }
}

abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int page,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      @nullable AnimationController animationControllerB,
      @nullable Animation<Offset> animationOffsetB});
}

class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object page = freezed,
    Object animationController = freezed,
    Object animationOffset = freezed,
    Object animationControllerB = freezed,
    Object animationOffsetB = freezed,
  }) {
    return _then(_HomeState(
      page: page == freezed ? _value.page : page as int,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController as AnimationController,
      animationOffset: animationOffset == freezed
          ? _value.animationOffset
          : animationOffset as Animation<Offset>,
      animationControllerB: animationControllerB == freezed
          ? _value.animationControllerB
          : animationControllerB as AnimationController,
      animationOffsetB: animationOffsetB == freezed
          ? _value.animationOffsetB
          : animationOffsetB as Animation<Offset>,
    ));
  }
}

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.page = 0,
      @nullable this.animationController,
      @nullable this.animationOffset,
      @nullable this.animationControllerB,
      @nullable this.animationOffsetB})
      : assert(page != null);

  @JsonKey(defaultValue: 0)
  @override
  final int page;
  @override
  @nullable
  final AnimationController animationController;
  @override
  @nullable
  final Animation<Offset> animationOffset;
  @override
  @nullable
  final AnimationController animationControllerB;
  @override
  @nullable
  final Animation<Offset> animationOffsetB;

  @override
  String toString() {
    return 'HomeState(page: $page, animationController: $animationController, animationOffset: $animationOffset, animationControllerB: $animationControllerB, animationOffsetB: $animationOffsetB)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.animationController, animationController) ||
                const DeepCollectionEquality()
                    .equals(other.animationController, animationController)) &&
            (identical(other.animationOffset, animationOffset) ||
                const DeepCollectionEquality()
                    .equals(other.animationOffset, animationOffset)) &&
            (identical(other.animationControllerB, animationControllerB) ||
                const DeepCollectionEquality().equals(
                    other.animationControllerB, animationControllerB)) &&
            (identical(other.animationOffsetB, animationOffsetB) ||
                const DeepCollectionEquality()
                    .equals(other.animationOffsetB, animationOffsetB)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(animationController) ^
      const DeepCollectionEquality().hash(animationOffset) ^
      const DeepCollectionEquality().hash(animationControllerB) ^
      const DeepCollectionEquality().hash(animationOffsetB);

  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {int page,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      @nullable AnimationController animationControllerB,
      @nullable Animation<Offset> animationOffsetB}) = _$_HomeState;

  @override
  int get page;
  @override
  @nullable
  AnimationController get animationController;
  @override
  @nullable
  Animation<Offset> get animationOffset;
  @override
  @nullable
  AnimationController get animationControllerB;
  @override
  @nullable
  Animation<Offset> get animationOffsetB;
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
