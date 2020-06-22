import 'package:freezed_annotation/freezed_annotation.dart';

part 'reticle_color.freezed.dart';

@freezed
abstract class ReticleColor with _$ReticleColor {
  const factory ReticleColor.black() = _Black;
  const factory ReticleColor.white() = _White;

  static ReticleColor fromString(String colorString) {
    if (colorString == const ReticleColor.black().toString()) {
      return const ReticleColor.black();
    } else if (colorString == const ReticleColor.white().toString()) {
      return const ReticleColor.white();
    }
    return const ReticleColor.black();
  }
}
