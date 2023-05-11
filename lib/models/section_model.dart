class SectionModel {
  late int id;
  late String text;
  late int secretId;

  SectionModel({
    required this.id,
    required this.text,
    required this.secretId,
  });

  SectionModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'], 
        secretId = map['secret_id'];
}
