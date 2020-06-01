import 'dart:async';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:dotsite/entity/camera_error.dart';
import 'package:dotsite/entity/reticle_color.dart';
import 'package:flutter/animation.dart';

import 'dot_site_state.dart';
import 'package:state_notifier/state_notifier.dart';

class DotSiteStateNotifier extends StateNotifier<DotSiteState> {
  DotSiteStateNotifier()
      : super(const DotSiteState(
          initializedController: null,
          reticleTop: null,
          reticleLeft: null,
        )) {
    _initializeCameraControllerWithCameraNumber(state.cameraNumber, false);
  }

  @override
  void dispose() {
    state.initializedController.dispose();
    super.dispose();
  }

  List<int> availableRearCameraNumbers = [];

  void changeCamera(int cameraNumber) {
    _initializeCameraControllerWithCameraNumber(cameraNumber, false);
  }

  void _initializeCameraControllerWithCameraNumber(
      int cameraNumber, bool isRetry) {
    availableCameras().then((cameras) {
      if (availableRearCameraNumbers.isEmpty) {
        for (int i = 0; i < cameras.length; i++) {
          final camera = cameras[i];
          if (camera.lensDirection == CameraLensDirection.back) {
            availableRearCameraNumbers.add(i);
          }
        }
      }
      CameraDescription camera = cameras[cameraNumber];
      if (camera == null) {
        return;
      }
      CameraController controller =
          new CameraController(camera, ResolutionPreset.ultraHigh);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        state = state.copyWith(
            initializedController: controller, cameraNumber: cameraNumber);
      }).catchError((err) {
        if (err is CameraException) {
          if (isRetry) return;
          state = state.copyWith(
              cameraError: CameraError.selectedCameraCanNotUseError());
          _initializeCameraControllerWithCameraNumber(state.cameraNumber, true);
        }
      });
    });
  }

  void consumeError() {
    state = state.copyWith(cameraError: null);
  }

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setAnimationParameter(
      AnimationController controller, Animation<Offset> offset) {
    state = state.copyWith(
        animationController: controller, animationOffset: offset);
  }

  void showedSettingBottomSheet() {
    state = state.copyWith(settingModalBottomSheetShowed: true);
  }

  void hideSettingBottomSheet() {
    state = state.copyWith(settingModalBottomSheetShowed: false);
  }

  void plusOneTop() {
    state = state.copyWith(reticleTop: state.reticleTop + 1.0);
  }

  void minusOneTop() {
    state = state.copyWith(reticleTop: state.reticleTop - 1.0);
  }

  void plusOneLeft() {
    state = state.copyWith(reticleLeft: state.reticleLeft + 1.0);
  }

  void minusOneLeft() {
    state = state.copyWith(reticleLeft: state.reticleLeft - 1.0);
  }

  void setTop(double top) {
    state = state.copyWith(reticleTop: top);
  }

  void setLeft(double left) {
    state = state.copyWith(reticleLeft: left);
  }

  static const _longMoveAmount = 20.0;
  static const _durationMilliseconds = 200;

  Timer _minusTopLongMoveTimer;
  void startMinusTopLongMove() {
    _minusTopLongMoveTimer = Timer.periodic(
        const Duration(milliseconds: _durationMilliseconds), (Timer timer) {
      _minusTopLongMove();
    });
  }

  void endMinusTopLongMove() {
    _minusTopLongMoveTimer?.cancel();
  }

  void _minusTopLongMove() {
    state = state.copyWith(reticleTop: state.reticleTop - _longMoveAmount);
  }

  Timer _plusTopLongMoveTimer;
  void startPlusTopLongMove() {
    _plusTopLongMoveTimer = Timer.periodic(
        const Duration(milliseconds: _durationMilliseconds), (Timer timer) {
      _plusTopLongMove();
    });
  }

  void endPlusTopLongMove() {
    _plusTopLongMoveTimer?.cancel();
  }

  void _plusTopLongMove() {
    state = state.copyWith(reticleTop: state.reticleTop + _longMoveAmount);
  }

  Timer _minusLeftLongMoveTimer;
  void startMinusLeftLongMove() {
    _minusLeftLongMoveTimer = Timer.periodic(
        const Duration(milliseconds: _durationMilliseconds), (Timer timer) {
      _minusLeftLongMove();
    });
  }

  void endMinusLeftLongMove() {
    _minusLeftLongMoveTimer?.cancel();
  }

  void _minusLeftLongMove() {
    state = state.copyWith(reticleLeft: state.reticleLeft - _longMoveAmount);
  }

  Timer _plusLeftLongMoveTimer;
  void startPlusLeftLongMove() {
    _plusLeftLongMoveTimer = Timer.periodic(
        const Duration(milliseconds: _durationMilliseconds), (Timer timer) {
      _plusLeftLongMove();
    });
  }

  void endPlusLeftLongMove() {
    _plusLeftLongMoveTimer?.cancel();
  }

  void _plusLeftLongMove() {
    state = state.copyWith(reticleLeft: state.reticleLeft + _longMoveAmount);
  }

  void setReticleColor(ReticleColor color) {
    state = state.copyWith(reticleColor: color);
  }

  void setSize(double size) {
    state = state.copyWith(reticleSize: size);
  }
}
