// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:objectbox/objectbox.dart';
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'db/box/settings.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:2071562066148463719",
        "lastPropertyId": "7:6390464174058504453",
        "name": "Settings",
        "properties": [
          {"id": "1:301075418107197583", "name": "id", "type": 6, "flags": 1},
          {"id": "2:1665851374726801746", "name": "name", "type": 9},
          {"id": "3:5728686135324958078", "name": "cameraNumber", "type": 6},
          {"id": "4:4919021125034592263", "name": "reticleColor", "type": 9},
          {"id": "5:1664482676013784440", "name": "reticleTop", "type": 8},
          {"id": "6:4514082698812377840", "name": "reticleLeft", "type": 8},
          {"id": "7:6390464174058504453", "name": "reticleSize", "type": 8}
        ]
      }
    ],
    "lastEntityId": "1:2071562066148463719",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = Map<Type, EntityDefinition>();
  bindings[Settings] = EntityDefinition<Settings>(
      model: model.findEntityByUid(2071562066148463719),
      reader: (Settings inst) => {
            "id": inst.id,
            "name": inst.name,
            "cameraNumber": inst.cameraNumber,
            "reticleColor": inst.reticleColor,
            "reticleTop": inst.reticleTop,
            "reticleLeft": inst.reticleLeft,
            "reticleSize": inst.reticleSize
          },
      writer: (Map<String, dynamic> members) {
        Settings r = Settings();
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

class Settings_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final cameraNumber =
      QueryIntegerProperty(entityId: 1, propertyId: 3, obxType: 6);
  static final reticleColor =
      QueryStringProperty(entityId: 1, propertyId: 4, obxType: 9);
  static final reticleTop =
      QueryDoubleProperty(entityId: 1, propertyId: 5, obxType: 8);
  static final reticleLeft =
      QueryDoubleProperty(entityId: 1, propertyId: 6, obxType: 8);
  static final reticleSize =
      QueryDoubleProperty(entityId: 1, propertyId: 7, obxType: 8);
}
