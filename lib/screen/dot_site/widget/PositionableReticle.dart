import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PositionableReticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((DotSiteState s) {
      final state = s;

      final positionOffset = state.reticleSize;
      final screenSize = MediaQuery.of(context).size;

      final top = state.reticleTop ??
          () {
            // TODO: 画面の中央座標を取得する処理を実装する
            // final initialHeight = screenSize.height / 2 - positionOffset - 20;
            final initialHeight = 176.3;
            WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
              context.read<DotSiteStateNotifier>().setTop(initialHeight);
            });
            return initialHeight;
          }();

      final left = state.reticleLeft ??
          () {
            // TODO: 画面の中央座標を取得する処理を実装する
            // final initialWidth = screenSize.width / 2 - positionOffset + 20;
            final initialWidth = 395.7;
            WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
              context.read<DotSiteStateNotifier>().setLeft(initialWidth);
            });
            return initialWidth;
          }();
      return Positioned(
          top: s.reticleTop ?? top,
          left: s.reticleLeft ?? left,
          width: positionOffset,
          height: positionOffset,
          child: Icon(Icons.add,
              size: s.reticleSize,
              color: s.reticleColor
                  .when(black: () => Colors.black, white: () => Colors.white)));
    });
  }
}
