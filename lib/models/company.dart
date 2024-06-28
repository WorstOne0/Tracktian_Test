class Company {
  late String id;
  late String name;

  Company.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }
}
