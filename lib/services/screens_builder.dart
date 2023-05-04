import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/main_screen/main_screen.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/secrets_screen/screens/secrets_screen.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/section_screen/screens/section_screen.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/blocks/sections_screen/screens/sections_screen.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/models/section_model.dart';
import 'package:secrets_website/models/sections_screen_sections_model.dart';
import 'package:secrets_website/services/api.dart';
import 'package:secrets_website/services/functions.dart';
import 'package:secrets_website/services/screens_controller.dart';

class ScreensBuilder {
  static void secretsScreen() async {
    // ScreensController screensController = Get.put(ScreensController());
    SecretsScreenController secretsScreenController =
        Get.put(SecretsScreenController());
    // Functions.loader();
    Future<List<SecretsScreenSecretModel>> secrets = Api.getSecrets();
    secretsScreenController.secretsScreenSecretModelList = await secrets;
    secretsScreenController.loading.value = false;
    // // Functions.loaderPop();
    // screensController.widget.value = SecretsScreen();
  }
  static void sectionsScreen(int id) async {
    // ScreensController screensController = Get.put(ScreensController());
    SectionsScreenController sectionsScreenController =
        Get.put(SectionsScreenController());
    // Functions.loader();
    Future<List<SectionsScreenSectionsModel>> sections = Api.getSections(id);
    sectionsScreenController.sectionsScreenSectionsModelList = await sections;
    sectionsScreenController.loading.value = false;
    // Functions.loaderPop();
    // screensController.widget.value = SectionsScreen();
  }
  static void sectionScreen(int id) async {
    // ScreensController screensController = Get.put(ScreensController());
    SectionScreenController sectionScreenController =
        Get.put(SectionScreenController());
    // Functions.loader();
    SectionModel? section = await Api.getSection(id);
    sectionScreenController.sectionModel.value = section;
    sectionScreenController.loading.value = false;
    // Functions.loaderPop();
    // screensController.widget.value = SectionsScreen();
  }

  static Widget getFirstScreen() {
    secretsScreen();
    return SecretsScreen();
  }
}
