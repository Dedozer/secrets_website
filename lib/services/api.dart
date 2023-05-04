import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/models/section_model.dart';
import 'package:secrets_website/models/sections_screen_sections_model.dart';

class Api {
  static const String _apiEndpoint = 'http://192.168.1.146:80';

  static Future<List<SecretsScreenSecretModel>> getSecrets() async {
    var response =
        await http.get(Uri.parse('$_apiEndpoint/secrets/'), headers: {
      "Access-Control-Allow-Origin": "*",
    });

    if (response.statusCode == 200) {
      var secrets = (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((project) => SecretsScreenSecretModel.fromJson(project))
          .toList();
      return secrets;
    }
    return [];
  }

  static Future<List<SectionsScreenSectionsModel>> getSections(int id) async {
    var response =
        await http.get(Uri.parse('$_apiEndpoint/secrets/$id'), headers: {
      "Access-Control-Allow-Origin": "*",
    });

    if (response.statusCode == 200) {
      var sections = ((json.decode(utf8.decode(response.bodyBytes))
              as Map)['secret_sections'] as List)
          .map((section) => SectionsScreenSectionsModel.fromJson(section))
          .toList();
      return sections;
    }
    return [];
  }

  static Future<SectionModel?> getSection(int id) async {
    var response =
        await http.get(Uri.parse('$_apiEndpoint/sections/$id'), headers: {
      "Access-Control-Allow-Origin": "*",
    });

    if (response.statusCode == 200) {
      var section =
          SectionModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      print(section.text);
      return section;
    } else {
      return null;
    }
  }
}
