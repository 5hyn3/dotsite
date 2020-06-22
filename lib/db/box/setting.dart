import "package:objectbox/objectbox.dart";

import 'package:dotsite/entity/setting.dart' as setting_entity;

@Entity()
class Setting {
  @Id()
  int id;
  String name;
  int cameraNumber;
  String reticleColor;
  double reticleTop;
  double reticleLeft;
  double reticleSize;

  Setting(
      {String name,
      int cameraNumber,
      String reticleColor,
      double reticleTop,
      double reticleLeft,
      double reticleSize});

  Setting.construct(setting_entity.Setting settings) {
    name = settings.name;
    cameraNumber = settings.cameraNumber;
    reticleColor = settings.reticleColor.toString();
    reticleTop = settings.reticleTop;
    reticleLeft = settings.reticleLeft;
    reticleSize = settings.reticleSize;
  }
}
