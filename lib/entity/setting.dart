import 'package:dotsite/entity/reticle_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';

@freezed
abstract class Setting with _$Setting {
  const factory Setting({
    @required String name,
    @nullable int id,
    @nullable int cameraNumber,
    @nullable ReticleColor reticleColor,
    @nullable double reticleTop,
    @nullable double reticleLeft,
    @nullable double reticleSize,
  }) = _Setting;
}