class ExamType {
  String? name;
  int? nid;

  ExamType({this.name, this.nid});

  static ExamType fromJson(json) {
    return ExamType(name: json["name"], nid: json["nid"]);
  }
}
