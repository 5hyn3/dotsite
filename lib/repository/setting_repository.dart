import 'dart:async';
import 'dart:io';

import 'package:dotsite/db/box/setting.dart' as SettingBox;
import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/entity/setting.dart';

import '../objectbox.g.dart';

import 'package:path_provider/path_provider.dart';

class SettingRepository {
  Box _box;

  Future<Directory> _initTask;

  SettingRepository() {
    _initTask = getApplicationDocumentsDirectory();
    _initTask.then((dir) {
      _box = Box<SettingBox.Setting>(Store(getObjectBoxModel(), directory: dir.path + "/objectbox"));
    });
  }

  Future<Setting> getSetting(int id) async {
    await _initTask;
    final raw = _box.get(id);
    return Setting(
      id: raw.id,
      name: raw.name,
      cameraNumber: raw.cameraNumber,
      reticleColor: ReticleColor.fromString(raw.reticleColor),
      reticleTop: raw.reticleTop,
      reticleLeft: raw.reticleLeft,
      reticleSize: raw.reticleSize,
    );
  }

  Future<List<Setting>> getAllSettings() async {
    await _initTask;
    final raws = _box.getAll();
    return raws.map((r) => Setting(
      id: r.id,
      name: r.name,
      cameraNumber: r.cameraNumber,
      reticleColor: ReticleColor.fromString(r.reticleColor),
      reticleTop: r.reticleTop,
      reticleLeft: r.reticleLeft,
      reticleSize: r.reticleSize,
    )).toList();
  }

  Future<void> saveSetting(Setting setting) async {
    await _initTask;
    _box.put(SettingBox.Setting.construct(setting));
  }
}
