import 'package:dotsite/entity/reticle_color.dart';
import 'package:dotsite/screen/dot_site/dot_site_state.dart';
import 'package:dotsite/screen/dot_site/dot_site_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    final List<Widget> leftWidgets = [
      const Text(
        "レティクル",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      const Divider(),
      const Text(
        "色",
      ),
      DropdownButton(
        value: context.select((DotSiteState s) => s.reticleColor),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (ReticleColor newValue) {
          context.read<DotSiteStateNotifier>().setReticleColor(newValue);
        },
        items: [const ReticleColor.black(), const ReticleColor.white()]
            .map<DropdownMenuItem<ReticleColor>>((ReticleColor value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.when(black: () => "黒", white: () => "白")),
          );
        }).toList(),
      ),
      const Text("サイズ"),
      Slider(
        value: context.select((DotSiteState s) => s.reticleSize),
        min: 20,
        max: 80,
        onChanged: (double value) {
          context.read<DotSiteStateNotifier>().setSize(value);
        },
      ),
      const Text(
        "カメラ選択",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      const Divider(),
      DropdownButton(
        value: context.select((DotSiteState s) => s.cameraNumber),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (int newValue) {
          context.read<DotSiteStateNotifier>().changeCamera(newValue);
        },
        items: context
            .select((DotSiteState s) => s.availableRearCameraNumbers)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
      const Text(
        "その他の操作",
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () => showSaveSettingDialog(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            "設定の保存",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () => showAboutDialog(context: context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            "このアプリについて",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    ];
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              const Text("設定"),
              Flexible(child: ListView(children: leftWidgets)),
            ],
          ),
        ),
        const VerticalDivider(),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              const Text("設定の読み込み"),
              Flexible(
                  child: ListView(
                      children: context.select((DotSiteState s) => s.settings
                          .map((e) => Container(
                                child: Stack(children: <Widget>[
                                  Positioned.fill(
                                    child: InkWell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            e.name,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          context
                                              .read<DotSiteStateNotifier>()
                                              .applySettingById(e.id);
                                          Navigator.pop(context);
                                        }),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.delete_outline),
                                      onPressed: () => showDeleteSettingDialog(
                                          context, e.name, e.id),
                                    ),
                                  )
                                ]),
                              ))
                          .toList()))),
            ],
          ),
        ),
      ],
    );
  }

  void showSaveSettingDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AlertDialog(
                  title: const Text("設定の保存"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            TextField(
                              controller: context.select((DotSiteState s) =>
                                  s.settingNameTextEditingController),
                              decoration: const InputDecoration(
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

  void showDeleteSettingDialog(BuildContext context, String name, int id) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AlertDialog(
                  title: const Text("設定の削除"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Column(
                          children: <Widget>[Text("「$name」を削除します。")],
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
                        child: const Text('削除する'),
                        onPressed: () {
                          context
                              .read<DotSiteStateNotifier>()
                              .deleteSetting(id);
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
