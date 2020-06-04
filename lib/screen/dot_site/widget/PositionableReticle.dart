import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PositionableReticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((DotSiteState s) {
      final positionOffset = s.reticleSize / 2;
      final screenSize = MediaQuery.of(context).size;

      final top = s.reticleTop ??
          () {
            final initialTop = screenSize.height / 2 - positionOffset;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<DotSiteStateNotifier>().setTop(initialTop);
            });
            return initialTop;
          }();

      final left = s.reticleLeft ??
          () {
            final initialWidth = screenSize.width / 2 - positionOffset;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<DotSiteStateNotifier>().setLeft(initialWidth);
            });
            return initialWidth;
          }();
      return Positioned(
          top: top,
          left: left,
          width: s.reticleSize,
          height: s.reticleSize,
          child: Icon(Icons.add,
              size: s.reticleSize,
              color: s.reticleColor
                  .when(black: () => Colors.black, white: () => Colors.white)));
    });
  }
}
