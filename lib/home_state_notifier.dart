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

  void showedSettingBottomSheet() {
    state = state.copyWith(settingModalBottomSheetShowed: true);
  }


  void hideSettingBottomSheet() {
    state = state.copyWith(settingModalBottomSheetShowed: false);
  }
}

