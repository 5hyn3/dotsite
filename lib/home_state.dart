import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(0) int page,
    @nullable AnimationController animationController,
    @nullable Animation<Offset> animationOffset,
    @Default(false) bool settingModalBottomSheetShowed,
  }) = _HomeState;
}
