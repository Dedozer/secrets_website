import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/info_screen/data/info_screen_controller.dart';
import 'package:secrets_website/components/widgets/navbar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InfoScreenController infoScreenController =
        Get.find<InfoScreenController>();
    return Scaffold(
      appBar: MainAppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('1'),
        ),
      ),
    );
  }
}
