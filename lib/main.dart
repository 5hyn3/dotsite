import 'package:dotsite/repository/setting_repository.dart';
import 'package:dotsite/screen/dot_site/dot_site.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        Provider<SettingRepository>(create: (_) => SettingRepository()),
      ],
      child: DotSite(),
    ));
  });
}
