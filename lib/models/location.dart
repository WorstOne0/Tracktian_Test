class Location {
  late String id;
  late String name;
  String? parentId;

  Location.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    parentId = json["parentId"];
  }
}
