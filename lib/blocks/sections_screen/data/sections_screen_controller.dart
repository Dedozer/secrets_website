import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:secrets_website/locator.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/models/sections_screen_sections_model.dart';
import 'package:secrets_website/services/api.dart';
import 'package:secrets_website/services/navigation_service.dart';
import 'package:secrets_website/services/routing/routes.dart';

class SectionsScreenController extends GetxController{
  List<SectionsScreenSectionsModel> sectionsScreenSectionsModelList = [];
  Rx<bool> loading = true.obs;
}

class SectionsScreenControllerRouter extends ChangeNotifier{
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToProject(int id, int index) {
    _navigationService.navigateTo(Routes.section , queryParams: {'id' : id.toString(), 'index': index.toString()});
  }
}