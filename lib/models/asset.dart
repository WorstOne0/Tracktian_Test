class Asset {
  late String id;
  late String name;

  String? parentId;
  String? locationId;

  String? sensorId;
  String? sensorType;
  String? status;

  String? gatewayId;

  Asset.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];

    parentId = json["parentId"];
    locationId = json["locationId"];

    sensorId = json["sensorId"];
    sensorType = json["sensorType"];
    status = json["status"];

    gatewayId = json["gatewayId"];
  }
}
