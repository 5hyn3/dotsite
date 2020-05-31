import 'package:freezed_annotation/freezed_annotation.dart';

part 'reticle_color.freezed.dart';

@freezed
abstract class ReticleColor with _$ReticleColor {
  const factory ReticleColor.black() = _Black;
  const factory ReticleColor.white() = _White;

  static ReticleColor fromString(String colorString) {
    if(colorString == ReticleColor.black().toString()) {
      return ReticleColor.black();
    } else if(colorString == ReticleColor.white().toString()) {
      return ReticleColor.white();
    }
    return ReticleColor.black();
  }
}