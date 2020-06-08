import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:dotsite/screen/dot_site/widget/change_reticle_position_buttons.dart';
import 'package:dotsite/screen/dot_site/widget/positionable_reticle.dart';
import 'package:dotsite/screen/dot_site/widget/preview.dart';
import 'package:dotsite/screen/dot_site/widget/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:vsync_provider/vsync_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

class DotSite extends StatelessWidget {
  const DotSite();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          const VsyncProvider(isSingleTicker: false),
          StateNotifierProvider<DotSiteStateNotifier, DotSiteState>(
              create: (context) {
            final stateNotifier = DotSiteStateNotifier();
            stateNotifier.setPage(0);
            final vsync = VsyncProvider.of(context);
            final controller = AnimationController(
                vsync: vsync, duration: const Duration(milliseconds: 150));
            stateNotifier.setAnimationParameter(
                controller,
                MaterialPointArcTween(
                        begin: Offset.zero, end: const Offset(0.0, 1))
                    .animate(controller));
            return stateNotifier;
          })
        ],
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            const Locale('ja', 'JP'),
          ],
          title: 'Dot Site',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const DotSiteHome(),
        ));
  }
}

class DotSiteHome extends StatelessWidget {
  const DotSiteHome();

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
              icon: Icon(Icons.add), title: const Text("位置調整")),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: const Text("ホーム")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: const Text("設定")),
        ],
      ),
      body: Stack(
        children: const <Widget>[
          const Preview(),
          const Align(
              alignment: Alignment.bottomCenter,
              child: const AnimatedChangeReticlePositionButtons()),
          const PositionableReticle(),
        ],
      ),
    );
  }
}

void _showSettingModalBottomSheet(BuildContext context) {
  if (context.read<DotSiteState>().settingModalBottomSheetShowed) return;
  context.read<DotSiteStateNotifier>().showedSettingBottomSheet();
  showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: const Settings(),
        );
      }).whenComplete(() {
    context.read<DotSiteStateNotifier>().hideSettingBottomSheet();
    context.read<DotSiteStateNotifier>().setPage(1);
  });
}
