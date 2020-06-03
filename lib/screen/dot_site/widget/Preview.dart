import 'package:camera/camera.dart';
import 'package:dotsite/entity/camera_error.dart';
import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class Preview extends StatelessWidget {
  const Preview();
  @override
  Widget build(BuildContext context) {
    return context.select((DotSiteState s) {
      if (s.cameraError == CameraError.selectedCameraCanNotUseError()) {
        Fluttertoast.showToast(
            msg: "選択したカメラは使用できません",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<DotSiteStateNotifier>().consumeError();
        });
      }
      CameraController controller = s.initializedController;
      if (controller == null || !controller.value.isInitialized) {
        return Container();
      } else {
        return RotatedBox(
          quarterTurns: 3,
          child: Transform.scale(
            scale: 1 / controller.value.aspectRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );
      }
    });
  }
}
