import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_error.freezed.dart';

@freezed
abstract class CameraError with _$CameraError {
  const factory CameraError.selectedCameraCanNotUseError() = _SelectedCameraCanNotUseError;
}