import 'package:dotsite/entity/reticle_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    @required String name,
    @nullable int cameraNumber,
    @nullable ReticleColor reticleColor,
    @nullable double reticleTop,
    @nullable double reticleLeft,
    @nullable double reticleSize,
  }) = _Settings;
}