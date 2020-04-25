import 'package:dotsite/home_state_notifier.dart';
import 'package:dotsite/pointer_state.dart';
import 'package:dotsite/pointer_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'camera_state.dart';
import 'camera_state_notifier.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          VsyncProvider(isSingleTicker: false),
          StateNotifierProvider<HomeStateNotifier, HomeState>(
              create: (BuildContext context) {
            final stateNotifier = HomeStateNotifier();
            stateNotifier.setPage(0);
            final vsync = VsyncProvider.of(context);
            final controller = AnimationController(
                vsync: vsync,
                duration: Duration(milliseconds: 150));
            stateNotifier.setAnimationParameter(
                controller,
                MaterialPointArcTween(begin: Offset.zero, end: Offset(0.0, 1)).animate(controller)
            );

            final controllerB = AnimationController(
                vsync: vsync,
                duration: Duration(milliseconds: 150));

            stateNotifier.setAnimationParameterB(
                controllerB,
                MaterialPointArcTween(begin: Offset.zero, end: Offset(0.0, 1)).animate(controllerB)
            );
            controllerB.forward();
            return stateNotifier;
          }),
          StateNotifierProvider<PointerStateNotifier, PointerState>(
              create: (BuildContext context) => PointerStateNotifier()),
          StateNotifierProvider<CameraStateNotifier, CameraState>(
              create: (BuildContext context) => CameraStateNotifier()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.select((HomeState s) => s.page),
        onTap: (int page) {
          if (page == 1) {
            context.read<HomeState>().animationControllerB.reverse();
            context.read<HomeState>().animationController.forward();
          } else {
            context.read<HomeState>().animationControllerB.forward();
            context.read<HomeState>().animationController.reverse();
          }
          context.read<HomeStateNotifier>().setPage(page);
        },
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Home")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Setting")),
        ],
      ),
      body: Stack(
        children: <Widget>[
          const Preview(),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedChangePointerPositionButtons()),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedChangePointerPositionButtonsB()),
          PositionablePointer(),
        ],
      ),
    );
  }
}

class AnimatedChangePointerPositionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((HomeState s) {
      return SlideTransition(
          position: s.animationOffset, child: ChangePointerPositionButtons());
    });
  }
}

class AnimatedChangePointerPositionButtonsB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((HomeState s) {
      return SlideTransition(
          position: s.animationOffsetB, child: ChangePointerPositionButtonsB());
    });
  }
}

class ChangePointerPositionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_drop_up),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().minusOneTop();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_drop_down),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().plusOneTop();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_back),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().minusOneLeft();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_forward),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().plusOneLeft();
                },
              ))),
    ]);
  }
}

class ChangePointerPositionButtonsB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_drop_up),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().minusOneTop();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_drop_down),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().plusOneTop();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_back),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().minusOneLeft();
                },
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_forward),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  context.read<PointerStateNotifier>().plusOneLeft();
                },
              ))),
    ]);
  }
}

class PositionablePointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<PointerState>();

    double iconSize = 40;
    final positionOffset = iconSize;
    final screenSize = MediaQuery.of(context).size;

    final top = state.top ??
        () {
          // TODO: 画面の中央座標を取得する処理を実装する
          // final initialHeight = screenSize.height / 2 - positionOffset - 20;
          final initialHeight = 176.3;
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<PointerStateNotifier>().setTop(initialHeight);
          });
          return initialHeight;
        }();

    final left = state.left ??
        () {
          // TODO: 画面の中央座標を取得する処理を実装する
          // final initialWidth = screenSize.width / 2 - positionOffset + 20;
          final initialWidth = 395.7;
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<PointerStateNotifier>().setLeft(initialWidth);
          });
          return initialWidth;
        }();

    return context.select((PointerState s) {
      return Positioned(
          top: s.top ?? top,
          left: s.left ?? left,
          width: positionOffset,
          height: positionOffset,
          child: Icon(
            Icons.add,
            size: iconSize,
          ));
    });
  }
}

class Preview extends StatelessWidget {
  const Preview();
  @override
  Widget build(BuildContext context) {
    return context.select((CameraState s) {
      CameraController controller = s.initializedController;
      if (controller == null || !controller.value.isInitialized) {
        return Container();
      } else {
        return RotatedBox(
          quarterTurns: 3,
          child: Transform.scale(
            scale: 1 / controller.value.aspectRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );
      }
    });
  }
}
