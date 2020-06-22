import 'dart:async';
import 'dart:io';

import 'package:dotsite/db/box/setting.dart' as setting_box;
import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/entity/setting.dart';
import 'package:dotsite/objectbox.g.dart';

import 'package:path_provider/path_provider.dart';

class SettingRepository {
  Box<setting_box.Setting> _box;

  Future<Directory> _initTask;

  SettingRepository() {
    _initTask = getApplicationDocumentsDirectory();
    _initTask.then((dir) {
      _box = Box<setting_box.Setting>(
          Store(getObjectBoxModel(), directory: dir.path + "/objectbox"));
    });
  }

  Future<Setting> getSetting(int id) async {
    await _initTask;
    final setting_box.Setting raw = _box.get(id);
    return _settingBoxToEntity(raw);
  }

  Future<List<Setting>> getAllSettings() async {
    await _initTask;
    final List<setting_box.Setting> raws = _box.getAll();
    return raws.map((r) => _settingBoxToEntity(r)).toList();
  }

  Future<void> saveSetting(Setting setting) async {
    await _initTask;
    _box.put(setting_box.Setting.construct(setting));
  }

  Future<void> deleteSetting(int id) async {
    await _initTask;
    _box.remove(id);
  }

  Setting _settingBoxToEntity(setting_box.Setting settingBox) {
    return Setting(
      id: settingBox.id,
      name: settingBox.name,
      cameraNumber: settingBox.cameraNumber,
      reticleColor: ReticleColor.fromString(settingBox.reticleColor),
      reticleTop: settingBox.reticleTop,
      reticleLeft: settingBox.reticleLeft,
      reticleSize: settingBox.reticleSize,
    );
  }
}
