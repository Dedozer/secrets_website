import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/models/sections_screen_sections_model.dart';
import 'package:secrets_website/services/api.dart';

class SectionsScreenController extends GetxController{
  List<SectionsScreenSectionsModel> sectionsScreenSectionsModelList = [];
  Rx<bool> loading = true.obs;
}