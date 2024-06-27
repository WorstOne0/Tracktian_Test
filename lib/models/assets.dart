class Assets {
  late String id;

  Assets.fromJson(dynamic json) {
    id = json["_id"];
  }
}
