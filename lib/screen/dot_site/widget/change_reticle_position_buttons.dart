import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AnimatedChangeReticlePositionButtons extends StatelessWidget {
  const AnimatedChangeReticlePositionButtons();
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: context.select((DotSiteState s) => s.animationOffset),
        child: const ChangeReticlePositionButtons());
  }
}

class ChangeReticlePositionButtons extends StatelessWidget {
  const ChangeReticlePositionButtons();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: _getPositionButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () => context.read<DotSiteStateNotifier>().minusOneTop(),
            onLongPressStart: (_) =>
                context.read<DotSiteStateNotifier>().startMinusTopLongMove(),
            onLongPressEnd: (_) =>
                context.read<DotSiteStateNotifier>().endMinusTopLongMove(),
          )),
      Expanded(
          flex: 1,
          child: _getPositionButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () => context.read<DotSiteStateNotifier>().plusOneTop(),
            onLongPressStart: (_) =>
                context.read<DotSiteStateNotifier>().startPlusTopLongMove(),
            onLongPressEnd: (_) =>
                context.read<DotSiteStateNotifier>().endPlusTopLongMove(),
          )),
      Expanded(
          flex: 1,
          child: _getPositionButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>
                context.read<DotSiteStateNotifier>().minusOneLeft(),
            onLongPressStart: (_) =>
                context.read<DotSiteStateNotifier>().startMinusLeftLongMove(),
            onLongPressEnd: (_) =>
                context.read<DotSiteStateNotifier>().endMinusLeftLongMove(),
          )),
      Expanded(
          flex: 1,
          child: _getPositionButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => context.read<DotSiteStateNotifier>().plusOneLeft(),
            onLongPressStart: (_) =>
                context.read<DotSiteStateNotifier>().startPlusLeftLongMove(),
            onLongPressEnd: (_) =>
                context.read<DotSiteStateNotifier>().endPlusLeftLongMove(),
          )),
    ]);
  }

  Widget _getPositionButton(
      {@required Icon icon,
      @required VoidCallback onPressed,
      @required GestureLongPressStartCallback onLongPressStart,
      @required GestureLongPressEndCallback onLongPressEnd}) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onLongPressStart: onLongPressStart,
          onLongPressEnd: onLongPressEnd,
          child: RaisedButton(
            child: icon,
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: onPressed,
          ),
        ));
  }
}
