import 'package:camera/camera.dart';

import 'camera_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CameraStateNotifier extends StateNotifier<CameraState> {
  CameraStateNotifier()
      : super(const CameraState(initializedController: null)) {
    availableCameras().then((cameras) {
      int cameraNumber = 0;
      CameraDescription rearCamera = cameras[cameraNumber];
      if (rearCamera == null) {
        return;
      }
      CameraController controller =
          new CameraController(rearCamera, ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        state = state.copyWith(initializedController: controller);
      });
    });
  }

  @override
  void dispose() {
    state.initializedController.dispose();
    super.dispose();
  }
}
