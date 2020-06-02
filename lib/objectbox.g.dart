// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:objectbox/objectbox.dart';
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'db/box/setting.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "2:5510634672355898769",
        "lastPropertyId": "7:5730168241922598110",
        "name": "Setting",
        "properties": [
          {"id": "1:2616540046861979207", "name": "id", "type": 6, "flags": 1},
          {"id": "2:2326905228777746265", "name": "name", "type": 9},
          {"id": "3:4934611905861271900", "name": "cameraNumber", "type": 6},
          {"id": "4:1305217996426304758", "name": "reticleColor", "type": 9},
          {"id": "5:6686565235693271008", "name": "reticleTop", "type": 8},
          {"id": "6:6712264924685266511", "name": "reticleLeft", "type": 8},
          {"id": "7:5730168241922598110", "name": "reticleSize", "type": 8}
        ]
      }
    ],
    "lastEntityId": "2:5510634672355898769",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = Map<Type, EntityDefinition>();
  bindings[Setting] = EntityDefinition<Setting>(
      model: model.findEntityByUid(5510634672355898769),
      reader: (Setting inst) => {
            "id": inst.id,
            "name": inst.name,
            "cameraNumber": inst.cameraNumber,
            "reticleColor": inst.reticleColor,
            "reticleTop": inst.reticleTop,
            "reticleLeft": inst.reticleLeft,
            "reticleSize": inst.reticleSize
          },
      writer: (Map<String, dynamic> members) {
        Setting r = Setting();
        r.id = members["id"];
        r.name = members["name"];
        r.cameraNumber = members["cameraNumber"];
        r.reticleColor = members["reticleColor"];
        r.reticleTop = members["reticleTop"];
        r.reticleLeft = members["reticleLeft"];
        r.reticleSize = members["reticleSize"];
        return r;
      });

  return ModelDefinition(model, bindings);
}

class Setting_ {
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 2, propertyId: 2, obxType: 9);
  static final cameraNumber =
      QueryIntegerProperty(entityId: 2, propertyId: 3, obxType: 6);
  static final reticleColor =
      QueryStringProperty(entityId: 2, propertyId: 4, obxType: 9);
  static final reticleTop =
      QueryDoubleProperty(entityId: 2, propertyId: 5, obxType: 8);
  static final reticleLeft =
      QueryDoubleProperty(entityId: 2, propertyId: 6, obxType: 8);
  static final reticleSize =
      QueryDoubleProperty(entityId: 2, propertyId: 7, obxType: 8);
}
