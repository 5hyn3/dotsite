import 'package:freezed_annotation/freezed_annotation.dart';

part 'pointer_state.freezed.dart';

@freezed
abstract class PointerState with _$PointerState {
  const factory PointerState({
    @nullable double top,
    @nullable double left,
    @nullable double size,
  }) =_PointerState;
}