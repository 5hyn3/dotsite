import 'package:dotsite/repository/setting_repository.dart';

import 'entity/camera_error.dart';
import 'package:dotsite/home_state_notifier.dart';
import 'entity/reticle_color.dart';
import 'entity/settings.dart' as SettingEntity;
import 'package:dotsite/reticle_state.dart';
import 'package:dotsite/reticle_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'camera_state.dart';
import 'camera_state_notifier.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
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
                vsync: vsync, duration: Duration(milliseconds: 150));
            stateNotifier.setAnimationParameter(
                controller,
                MaterialPointArcTween(begin: Offset.zero, end: Offset(0.0, 1))
                    .animate(controller));
            return stateNotifier;
          }),
          StateNotifierProvider<ReticleStateNotifier, ReticleState>(
              create: (BuildContext context) => ReticleStateNotifier()),
          StateNotifierProvider<CameraStateNotifier, CameraState>(
              create: (BuildContext context) => CameraStateNotifier()),
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
    context.select((HomeState s) {
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
        currentIndex: context.select((HomeState s) => s.page),
        onTap: (int page) {
          context.read<HomeStateNotifier>().setPage(page);
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

class AnimatedChangeReticlePositionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.select((HomeState s) {
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
                    .read<ReticleStateNotifier>()
                    .startMinusTopLongMove(),
                onLongPressEnd: (details) =>
                    context.read<ReticleStateNotifier>().endMinusTopLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_drop_up),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ReticleStateNotifier>().minusOneTop();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) =>
                    context.read<ReticleStateNotifier>().startPlusTopLongMove(),
                onLongPressEnd: (details) =>
                    context.read<ReticleStateNotifier>().endPlusTopLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_drop_down),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ReticleStateNotifier>().plusOneTop();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) => context
                    .read<ReticleStateNotifier>()
                    .startMinusLeftLongMove(),
                onLongPressEnd: (details) =>
                    context.read<ReticleStateNotifier>().endMinusLeftLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_back),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ReticleStateNotifier>().minusOneLeft();
                  },
                ),
              ))),
      Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onLongPressStart: (details) => context
                    .read<ReticleStateNotifier>()
                    .startPlusLeftLongMove(),
                onLongPressEnd: (details) =>
                    context.read<ReticleStateNotifier>().endPlusLeftLongMove(),
                child: RaisedButton(
                  child: Icon(Icons.arrow_forward),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<ReticleStateNotifier>().plusOneLeft();
                  },
                ),
              ))),
    ]);
  }
}

class PositionableReticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ReticleState>();

    final positionOffset = state.size;
    final screenSize = MediaQuery.of(context).size;

    final top = state.top ??
        () {
          // TODO: 画面の中央座標を取得する処理を実装する
          // final initialHeight = screenSize.height / 2 - positionOffset - 20;
          final initialHeight = 176.3;
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<ReticleStateNotifier>().setTop(initialHeight);
          });
          return initialHeight;
        }();

    final left = state.left ??
        () {
          // TODO: 画面の中央座標を取得する処理を実装する
          // final initialWidth = screenSize.width / 2 - positionOffset + 20;
          final initialWidth = 395.7;
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<ReticleStateNotifier>().setLeft(initialWidth);
          });
          return initialWidth;
        }();

    return context.select((ReticleState s) {
      return Positioned(
          top: s.top ?? top,
          left: s.left ?? left,
          width: positionOffset,
          height: positionOffset,
          child: Icon(Icons.add,
              size: s.size,
              color: s.color
                  .when(black: () => Colors.black, white: () => Colors.white)));
    });
  }
}

class Preview extends StatelessWidget {
  const Preview();
  @override
  Widget build(BuildContext context) {
    return context.select((CameraState s) {
      if (s.error == CameraError.selectedCameraCanNotUseError()) {
        Fluttertoast.showToast(
            msg: "選択したカメラは使用できません",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<CameraStateNotifier>().consumeError();
        });
      }
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

void _showSettingModalBottomSheet(BuildContext context) {
  if (context.read<HomeState>().settingModalBottomSheetShowed) return;
  context.read<HomeStateNotifier>().showedSettingBottomSheet();
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
    context.read<HomeStateNotifier>().hideSettingBottomSheet();
    context.read<HomeStateNotifier>().setPage(1);
  });
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leftWidgets = [
      Text("設定"),
      Text("レティクル"),
      Text("色"),
      DropdownButton(
        value: context.select((ReticleState s) => s.color),
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (ReticleColor newValue) {
          context.read<ReticleStateNotifier>().setColor(newValue);
        },
        items: [ReticleColor.black(), ReticleColor.white()]
            .map<DropdownMenuItem<ReticleColor>>((ReticleColor value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.when(black: () => "黒", white: () => "白")),
          );
        }).toList(),
      ),
      Text("サイズ"),
      Slider(
        value: context.select((ReticleState s) => s.size),
        min: 20,
        max: 80,
        onChanged: (double value) {
          context.read<ReticleStateNotifier>().setSize(value);
        },
      ),
      Text("カメラ選択"),
      DropdownButton(
        value: context.select((CameraState s) => s.cameraNumber),
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (int newValue) {
          context.read<CameraStateNotifier>().changeCamera(newValue);
        },
        items: context
            .read<CameraStateNotifier>()
            .availableRearCameraNumbers
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
      InkWell(
        onTap: () {
          showSaveSettingDialog(context);
        },
        child: Text("設定の保存"),
      ),
      InkWell(
        onTap: () {
          showAboutDialog(context: context);
        },
        child: Text("このアプリについて"),
      ),
    ];
    var rightWidgets = [
      Text("設定の読み込み"),
      Text("item1"),
      Text("item2"),
      Text("item3"),
      Text("item4"),
    ];
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ListView(children: leftWidgets),
        ),
        VerticalDivider(),
        Expanded(
          flex: 1,
          child: ListView(children: rightWidgets),
        ),
      ],
    );
  }

  Future showSaveSettingDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AlertDialog(
                  title: Text("設定の保存"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                labelText: '設定の名前を入力してください',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                        child: const Text('キャンセル'),
                        onPressed: () {
                          SettingRepository().getSetting(8);
                          Navigator.pop(context);
                        }),
                    FlatButton(
                        child: const Text('保存する'),
                        onPressed: () {
                          SettingRepository().saveSetting(SettingEntity.Settings(
                            name: "hoge",
                            cameraNumber: 0,
                            reticleColor: ReticleColor.black(),
                            reticleTop: 100,
                            reticleLeft: 100,
                            reticleSize: 40,
                          ));
                          Navigator.pop(context);
                        })
                  ],
                ),
              ],
            ),
          );
        });
  }
}
