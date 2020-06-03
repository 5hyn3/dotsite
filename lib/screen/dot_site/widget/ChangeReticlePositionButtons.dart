import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AnimatedChangeReticlePositionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((DotSiteState s) {
      return SlideTransition(
          position: s.animationOffset, child: ChangeReticlePositionButtons());
    });
  }
}

class ChangeReticlePositionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) => context
                    .read<DotSiteStateNotifier>()
                    .startMinusTopLongMove(),
                onLongPressEnd: (details) =>
                    context.read<DotSiteStateNotifier>().endMinusTopLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_drop_up),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<DotSiteStateNotifier>().minusOneTop();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) =>
                    context.read<DotSiteStateNotifier>().startPlusTopLongMove(),
                onLongPressEnd: (details) =>
                    context.read<DotSiteStateNotifier>().endPlusTopLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_drop_down),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<DotSiteStateNotifier>().plusOneTop();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) => context
                    .read<DotSiteStateNotifier>()
                    .startMinusLeftLongMove(),
                onLongPressEnd: (details) =>
                    context.read<DotSiteStateNotifier>().endMinusLeftLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_back),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<DotSiteStateNotifier>().minusOneLeft();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) => context
                    .read<DotSiteStateNotifier>()
                    .startPlusLeftLongMove(),
                onLongPressEnd: (details) =>
                    context.read<DotSiteStateNotifier>().endPlusLeftLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_forward),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<DotSiteStateNotifier>().plusOneLeft();
                  },
                ),
              ))),
    ]);
  }
}
