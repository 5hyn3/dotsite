import 'package:dotsite/repository/setting_repository.dart';
import 'package:dotsite/screen/dot_site/dot_site.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MultiProvider(
    providers: [
      Provider<SettingRepository>(create: (_) => SettingRepository()),
    ],
    child: const DotSite(),
  ));
}
