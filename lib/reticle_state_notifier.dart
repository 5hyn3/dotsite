import 'dart:async';

import 'entity/reticle_color.dart';

import 'reticle_state.dart';
import 'package:state_notifier/state_notifier.dart';

class ReticleStateNotifier extends StateNotifier<ReticleState> {
  ReticleStateNotifier()
      : super(const ReticleState()) {
    state = state.copyWith(
      top: null,
      left: null
    );
  }

  void plusOneTop() {
    state = state.copyWith(top: state.top + 1.0);
  }

  void minusOneTop() {
    state = state.copyWith(top: state.top - 1.0);
  }

  void plusOneLeft() {
    state = state.copyWith(left: state.left + 1.0);
  }

  void minusOneLeft() {
    state = state.copyWith(left: state.left - 1.0);
  }

  void setTop(double top) {
    state = state.copyWith(top: top);
  }
  void setLeft(double left) {
    state = state.copyWith(left: left);
  }

  static const _longMoveAmount = 20.0;
  static const _durationMilliseconds = 200;

  Timer _minusTopLongMoveTimer;
  void startMinusTopLongMove() {
    _minusTopLongMoveTimer = Timer.periodic(const Duration(milliseconds: _durationMilliseconds), (Timer timer){ _minusTopLongMove(); });
  }
  void endMinusTopLongMove() {
    _minusTopLongMoveTimer?.cancel();
  }
  void _minusTopLongMove() {
    state = state.copyWith(top: state.top - _longMoveAmount);
  }

  Timer _plusTopLongMoveTimer;
  void startPlusTopLongMove() {
    _plusTopLongMoveTimer = Timer.periodic(const Duration(milliseconds: _durationMilliseconds), (Timer timer){ _plusTopLongMove(); });
  }
  void endPlusTopLongMove() {
    _plusTopLongMoveTimer?.cancel();
  }
  void _plusTopLongMove() {
    state = state.copyWith(top: state.top + _longMoveAmount);
  }

  Timer _minusLeftLongMoveTimer;
  void startMinusLeftLongMove() {
    _minusLeftLongMoveTimer = Timer.periodic(const Duration(milliseconds: _durationMilliseconds), (Timer timer){ _minusLeftLongMove(); });
  }
  void endMinusLeftLongMove() {
    _minusLeftLongMoveTimer?.cancel();
  }
  void _minusLeftLongMove() {
    state = state.copyWith(left: state.left - _longMoveAmount);
  }

  Timer _plusLeftLongMoveTimer;
  void startPlusLeftLongMove() {
    _plusLeftLongMoveTimer = Timer.periodic(const Duration(milliseconds: _durationMilliseconds), (Timer timer){ _plusLeftLongMove(); });
  }
  void endPlusLeftLongMove() {
    _plusLeftLongMoveTimer?.cancel();
  }
  void _plusLeftLongMove() {
    state = state.copyWith(left: state.left + _longMoveAmount);
  }

  void setColor(ReticleColor color) {
    state = state.copyWith(color: color);
  }

  void setSize(double size) {
    state = state.copyWith(size: size);
  }
}

