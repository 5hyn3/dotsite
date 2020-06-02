import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/entity/setting.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dotsite/entity/camera_error.dart';

part 'dot_site_state.freezed.dart';

@freezed
abstract class DotSiteState with _$DotSiteState {
  const factory DotSiteState({
    @nullable CameraController initializedController,
    @Default(0) int cameraNumber,
    @nullable CameraError cameraError,
    @Default(0) int page,
    @nullable AnimationController animationController,
    @nullable Animation<Offset> animationOffset,
    @Default(false) bool settingModalBottomSheetShowed,
    @nullable double reticleTop,
    @nullable double reticleLeft,
    @Default(40) double reticleSize,
    @Default(ReticleColor.black()) ReticleColor reticleColor,
    @Default([]) List<Setting> settings,
  }) = _DotSiteState;
}
