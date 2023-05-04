import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/services/screens_builder.dart';

class NavBar {
  static List<Widget> navBarList = [
    IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        print(Get.context);
        Get.delete<SecretsScreenController>();
        Get.delete<SectionScreenController>();
        Get.delete<SectionsScreenController>();
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
              builder: (context) => ScreensBuilder.getFirstScreen()),
        );
      },
    ),
  ];
}
