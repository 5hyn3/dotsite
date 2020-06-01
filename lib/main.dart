import 'file:///C:/Users/shyne/Desktop/workspace/DIY/Flutter/dot_site/dot_site/lib/screen/dot_site/dot_site.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(DotSite());
  });
}