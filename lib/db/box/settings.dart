import "package:objectbox/objectbox.dart";

import '../../entity/settings.dart' as SettingsEntity;
@Entity()
class Settings {
  @Id()
  int id;
  String name;
  int cameraNumber;
  String reticleColor;
  double reticleTop;
  double reticleLeft;
  double reticleSize;

  Settings(
      {name, cameraNumber, reticleColor, reticleTop, reticleLeft, reticleSize});

  Settings.construct(SettingsEntity.Settings settings) {
    name = settings.name;
    cameraNumber = settings.cameraNumber;
    reticleColor = settings.reticleColor.toString();
    reticleTop = settings.reticleTop;
    reticleLeft = settings.reticleLeft;
    reticleSize = settings.reticleSize;
  }
}
