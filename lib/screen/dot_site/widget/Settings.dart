import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            .select((DotSiteStateNotifier value) =>
                value.availableRearCameraNumbers)
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
                              controller: context.select(
                                  (DotSiteStateNotifier s) =>
                                      s.settingNameTextEditingController),
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
