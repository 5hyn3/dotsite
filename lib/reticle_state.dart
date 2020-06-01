import 'entity/reticle_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reticle_state.freezed.dart';

@freezed
abstract class ReticleState with _$ReticleState {
  const factory ReticleState({
    @nullable double top,
    @nullable double left,
    @Default(40) double size,
    @Default(ReticleColor.black()) ReticleColor color,
  }) =_ReticlerState;
}