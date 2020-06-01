import 'dart:async';
import 'dart:io';

import 'package:dotsite/db/box/settings.dart' as SettingsBox;
import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/entity/settings.dart';

import '../objectbox.g.dart';

import 'package:path_provider/path_provider.dart';

class SettingRepository {
  Box _box;

  Future<Directory> _initTask;

  SettingRepository() {
    _initTask = getApplicationDocumentsDirectory();
    _initTask.then((dir) {
      _box = Box<SettingsBox.Settings>(Store(getObjectBoxModel(), directory: dir.path + "/objectbox"));
    });
  }

  Future<Settings> getSetting(int id) async {
    await _initTask;
    final raw = _box.get(id);
    return Settings(
      name: raw.name,
      cameraNumber: raw.cameraNumber,
      reticleColor: ReticleColor.fromString(raw.reticleColor),
      reticleTop: raw.reticleTop,
      reticleLeft: raw.reticleLeft,
      reticleSize: raw.reticleSize,
    );
  }

  void saveSetting(Settings settings) async {
    await _initTask;
    _box.put(SettingsBox.Settings.construct(settings));
  }
}
