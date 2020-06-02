import 'package:dotsite/entity/camera_error.dart';
import 'package:dotsite/entity/reticle_color.dart';
import 'dot_site_state.dart';
import 'dot_site_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'package:provider/provider.dart';

import 'package:fluttertoast/fluttertoast.dart';

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

class PositionableReticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<DotSiteState>();

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

    return context.select((DotSiteState s) {
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

class Preview extends StatelessWidget {
  const Preview();
  @override
  Widget build(BuildContext context) {
    return context.select((DotSiteState s) {
      if (s.cameraError == CameraError.selectedCameraCanNotUseError()) {
        Fluttertoast.showToast(
            msg: "選択したカメラは使用できません",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<DotSiteStateNotifier>().consumeError();
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

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var leftWidgets = [
      Text("レティクル"),
      Text("色"),
      DropdownButton(
        value: context.select((DotSiteState s) => s.reticleColor),
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (ReticleColor newValue) {
          context.read<DotSiteStateNotifier>().setReticleColor(newValue);
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
        value: context.select((DotSiteState s) => s.reticleSize),
        min: 20,
        max: 80,
        onChanged: (double value) {
          context.read<DotSiteStateNotifier>().setSize(value);
        },
      ),
      Text("カメラ選択"),
      DropdownButton(
        value: context.select((DotSiteState s) => s.cameraNumber),
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (int newValue) {
          context.read<DotSiteStateNotifier>().changeCamera(newValue);
        },
        items: context
            .read<DotSiteStateNotifier>()
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
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Text("設定"),
              Flexible(child: ListView(children: leftWidgets)),
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Text("設定の読み込み"),
              Flexible(
                  child: ListView(
                      children: context.select((DotSiteState s) => s.settings
                          .map((e) => InkWell(
                              onTap: () {
                                context
                                    .read<DotSiteStateNotifier>()
                                    .applySettingById(e.id);
                                Navigator.pop(context);
                              },
                              child: Text(e.name)))
                          .toList()))),
            ],
          ),
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
                              controller: context
                                  .read<DotSiteStateNotifier>()
                                  .settingNameTextEditingController,
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
                          Navigator.pop(context);
                        }),
                    FlatButton(
                        child: const Text('保存する'),
                        onPressed: () {
                          context.read<DotSiteStateNotifier>().saveNowSetting();
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
