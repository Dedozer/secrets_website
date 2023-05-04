import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/main_screen/main_screen.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/secrets_screen/screens/secrets_screen.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/services/screens_builder.dart';
import 'package:secrets_website/services/screens_controller.dart';

void main() {
  Get.put(SectionsScreenController());
  Get.put(SectionScreenController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreensBuilder.getFirstScreen(),
    );
  }
}