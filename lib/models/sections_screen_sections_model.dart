class SectionsScreenSectionsModel {
  late int id;
  late String title;

  SectionsScreenSectionsModel({
    required this.id,
    required this.title,
  });

  SectionsScreenSectionsModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'];
}
