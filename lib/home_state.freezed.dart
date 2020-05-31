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
      bool settingModalBottomSheetShowed = false}) {
    return _HomeState(
      page: page,
      animationController: animationController,
      animationOffset: animationOffset,
      settingModalBottomSheetShowed: settingModalBottomSheetShowed,
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
  bool get settingModalBottomSheetShowed;

  $HomeStateCopyWith<HomeState> get copyWith;
}

abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {int page,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      bool settingModalBottomSheetShowed});
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
    Object settingModalBottomSheetShowed = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController as AnimationController,
      animationOffset: animationOffset == freezed
          ? _value.animationOffset
          : animationOffset as Animation<Offset>,
      settingModalBottomSheetShowed: settingModalBottomSheetShowed == freezed
          ? _value.settingModalBottomSheetShowed
          : settingModalBottomSheetShowed as bool,
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
      bool settingModalBottomSheetShowed});
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
    Object settingModalBottomSheetShowed = freezed,
  }) {
    return _then(_HomeState(
      page: page == freezed ? _value.page : page as int,
      animationController: animationController == freezed
          ? _value.animationController
          : animationController as AnimationController,
      animationOffset: animationOffset == freezed
          ? _value.animationOffset
          : animationOffset as Animation<Offset>,
      settingModalBottomSheetShowed: settingModalBottomSheetShowed == freezed
          ? _value.settingModalBottomSheetShowed
          : settingModalBottomSheetShowed as bool,
    ));
  }
}

class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState(
      {this.page = 0,
      @nullable this.animationController,
      @nullable this.animationOffset,
      this.settingModalBottomSheetShowed = false})
      : assert(page != null),
        assert(settingModalBottomSheetShowed != null);

  @JsonKey(defaultValue: 0)
  @override
  final int page;
  @override
  @nullable
  final AnimationController animationController;
  @override
  @nullable
  final Animation<Offset> animationOffset;
  @JsonKey(defaultValue: false)
  @override
  final bool settingModalBottomSheetShowed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(page: $page, animationController: $animationController, animationOffset: $animationOffset, settingModalBottomSheetShowed: $settingModalBottomSheetShowed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('animationController', animationController))
      ..add(DiagnosticsProperty('animationOffset', animationOffset))
      ..add(DiagnosticsProperty(
          'settingModalBottomSheetShowed', settingModalBottomSheetShowed));
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
            (identical(other.settingModalBottomSheetShowed,
                    settingModalBottomSheetShowed) ||
                const DeepCollectionEquality().equals(
                    other.settingModalBottomSheetShowed,
                    settingModalBottomSheetShowed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(animationController) ^
      const DeepCollectionEquality().hash(animationOffset) ^
      const DeepCollectionEquality().hash(settingModalBottomSheetShowed);

  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {int page,
      @nullable AnimationController animationController,
      @nullable Animation<Offset> animationOffset,
      bool settingModalBottomSheetShowed}) = _$_HomeState;

  @override
  int get page;
  @override
  @nullable
  AnimationController get animationController;
  @override
  @nullable
  Animation<Offset> get animationOffset;
  @override
  bool get settingModalBottomSheetShowed;
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
