import 'pointer_state.dart';
import 'package:state_notifier/state_notifier.dart';

class PointerStateNotifier extends StateNotifier<PointerState> {
  PointerStateNotifier()
      : super(const PointerState()) {
    state = state.copyWith(
      top: null,
      left: null,
      size: null
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
}

