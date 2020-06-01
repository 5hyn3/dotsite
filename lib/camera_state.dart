import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'entity/camera_error.dart';

part 'camera_state.freezed.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState({
    @nullable CameraController initializedController,
    @Default(0) int cameraNumber,
    @nullable CameraError error,
  }) = _CameraState;
}
