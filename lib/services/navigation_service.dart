import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String>? queryParams}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() {
    Get.delete<SecretsScreenController>();
    Get.delete<SectionScreenController>();
    Get.delete<SectionsScreenController>();
    return navigatorKey.currentState!.pop();
  }
}
