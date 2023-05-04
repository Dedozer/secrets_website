class SectionModel {
  late int id;
  late String text;

  SectionModel({
    required this.id,
    required this.text,
  });

  SectionModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'];
}
