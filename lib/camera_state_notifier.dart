import 'package:camera/camera.dart';
import 'entity/camera_error.dart';

import 'camera_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CameraStateNotifier extends StateNotifier<CameraState> {
  CameraStateNotifier()
      : super(const CameraState(initializedController: null)) {
    _initializeCameraControllerWithCameraNumber(state.cameraNumber, false);
  }

  List<int> availableRearCameraNumbers = [];

  void changeCamera(int cameraNumber) {
    _initializeCameraControllerWithCameraNumber(cameraNumber, false);
  }

  void _initializeCameraControllerWithCameraNumber(int cameraNumber, bool isRetry) {
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
          state = state.copyWith(error: CameraError.selectedCameraCanNotUseError());
          _initializeCameraControllerWithCameraNumber(state.cameraNumber, true);
        }
      });
    });
  }

  void consumeError() {
    state = state.copyWith(error: null);
  }

  @override
  void dispose() {
    state.initializedController.dispose();
    super.dispose();
  }
}
