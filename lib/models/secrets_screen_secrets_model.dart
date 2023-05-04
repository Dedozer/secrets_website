class SecretsScreenSecretModel {
  late int id;
  late String title;

  SecretsScreenSecretModel({
    required this.id,
    required this.title,
  });

  SecretsScreenSecretModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'];
}
