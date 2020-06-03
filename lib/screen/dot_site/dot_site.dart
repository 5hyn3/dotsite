import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:dotsite/screen/dot_site/widget/ChangeReticlePositionButtons.dart';
import 'package:dotsite/screen/dot_site/widget/PositionableReticle.dart';
import 'package:dotsite/screen/dot_site/widget/Preview.dart';
import 'package:dotsite/screen/dot_site/widget/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'package:provider/provider.dart';

class DotSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          VsyncProvider(isSingleTicker: false),
          StateNotifierProvider<DotSiteStateNotifier, DotSiteState>(
              create: (BuildContext context) {
            final stateNotifier = DotSiteStateNotifier();
            stateNotifier.setPage(0);
            final vsync = VsyncProvider.of(context);
            final controller = AnimationController(
                vsync: vsync, duration: Duration(milliseconds: 150));
            stateNotifier.setAnimationParameter(
                controller,
                MaterialPointArcTween(begin: Offset.zero, end: Offset(0.0, 1))
                    .animate(controller));
            return stateNotifier;
          })
        ],
        child: MaterialApp(
          title: 'Dot Site',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: DotSiteHome(),
        ));
  }
}

class DotSiteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.select((DotSiteState s) {
      switch (s.page) {
        case 0:
          s.animationController.reverse();
          break;
        case 1:
          s.animationController.forward();
          break;
        case 2:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showSettingModalBottomSheet(context);
          });
          break;
      }
    });
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.select((DotSiteState s) => s.page),
        onTap: (int page) {
          context.read<DotSiteStateNotifier>().setPage(page);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text("Positioning")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Setting")),
        ],
      ),
      body: Stack(
        children: <Widget>[
          const Preview(),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedChangeReticlePositionButtons()),
          PositionableReticle(),
        ],
      ),
    );
  }
}

void _showSettingModalBottomSheet(BuildContext context) {
  if (context.read<DotSiteState>().settingModalBottomSheetShowed) return;
  context.read<DotSiteStateNotifier>().showedSettingBottomSheet();
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Settings(),
        );
      }).whenComplete(() {
    context.read<DotSiteStateNotifier>().hideSettingBottomSheet();
    context.read<DotSiteStateNotifier>().setPage(1);
  });
}
