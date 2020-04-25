import 'dart:ui';

import 'package:flutter/animation.dart';

import 'home_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier()
      : super(const HomeState());
  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  void setAnimationParameter(AnimationController controller, Animation<Offset> offset) {
    state = state.copyWith(animationController: controller, animationOffset: offset);
  }

  Animation<Offset> getAnimationOffset() {
    return state.animationOffset;
  }

  void setAnimationParameterB(AnimationController controller, Animation<Offset> offset) {
    state = state.copyWith(animationControllerB: controller, animationOffsetB: offset);
  }

  Animation<Offset> getAnimationOffsetB() {
    return state.animationOffsetB;
  }
}

