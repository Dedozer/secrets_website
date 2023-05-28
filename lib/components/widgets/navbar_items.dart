import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/locator.dart';
import 'package:secrets_website/services/navigation_service.dart';
import 'package:secrets_website/services/routing/routes.dart';
import 'package:secrets_website/services/screens_builder.dart';
import 'dart:html' as html;

class NavBarItems {
  static List<Widget> navBarList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        onPressed: () {
          print(Get.context);
          Get.delete<SecretsScreenController>();
          Get.delete<SectionScreenController>();
          Get.delete<SectionsScreenController>();
          ScreensBuilder.secretsScreen();
          locator<NavigationService>().navigateTo(Routes.home);
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        onPressed: () {
          html.window.open('https://api.opoib.maxmur.info/admin', '1');
        },
      ),
    ),
  ];
}
