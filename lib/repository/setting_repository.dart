import 'dart:async';
import 'dart:io';

import 'package:dotsite/db/box/setting.dart' as setting_box;
import 'package:dotsite/db/box/setting_extension.dart';
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
      _box = Box<setting_box.Setting>(
          Store(getObjectBoxModel(), directory: dir.path + "/objectbox"));
    });
  }

  Future<Setting> getSetting(int id) async {
    await _initTask;
    final raw = _box.get(id);
    return _settingBoxToEntity(raw);
  }

  Future<List<Setting>> getAllSettings() async {
    await _initTask;
    final raws = _box.getAll();
    return raws.map((r) => _settingBoxToEntity(r)).toList();
  }

  Future<void> saveSetting(Setting setting) async {
    await _initTask;
    _box.put(setting_box.Setting.construct(setting));
  }

  Setting _settingBoxToEntity(setting_box.Setting settingBox) {
    return Setting(
      id: settingBox.id,
      name: settingBox.name,
      cameraNumber: settingBox.cameraNumber,
      reticleColor: ReticleColor.fromString(this.reticleColor),
      reticleTop: settingBox.reticleTop,
      reticleLeft: settingBox.reticleLeft,
      reticleSize: settingBox.reticleSize,
    );
  }
}

extension IndexedMap<T, E> on List<T> {
  List<E> indexedMap<E>(E Function(int index, T item) function) {
    final list = <E>[];
    asMap().forEach((index, element) {
      list.add(function(index, element));
    });
    return list;
  }
}
