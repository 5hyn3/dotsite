import 'package:dotsite/db/box/setting.dart' as setting_box;
import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/entity/setting.dart';

extension SettingBoxExt on setting_box.Setting {
  Setting toEntity() {
    return Setting(
      id: this.id,
      name: this.name,
      cameraNumber: this.cameraNumber,
      reticleColor: ReticleColor.fromString(this.reticleColor),
      reticleTop: this.reticleTop,
      reticleLeft: this.reticleLeft,
      reticleSize: this.reticleSize,
    );
  }
}
