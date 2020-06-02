import "package:objectbox/objectbox.dart";

import '../../entity/setting.dart' as SettingEntity;
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
      {name, cameraNumber, reticleColor, reticleTop, reticleLeft, reticleSize});

  Setting.construct(SettingEntity.Setting settings) {
    name = settings.name;
    cameraNumber = settings.cameraNumber;
    reticleColor = settings.reticleColor.toString();
    reticleTop = settings.reticleTop;
    reticleLeft = settings.reticleLeft;
    reticleSize = settings.reticleSize;
  }
}
