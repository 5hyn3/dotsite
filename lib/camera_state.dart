import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_state.freezed.dart';

@freezed
abstract class CameraState with _$CameraState {
  const factory CameraState({CameraController initializedController}) =
      _CameraState;
}
