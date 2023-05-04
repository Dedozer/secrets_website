import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/models/section_model.dart';
import 'package:secrets_website/services/api.dart';

class SectionScreenController extends GetxController{
  Rx<SectionModel?> sectionModel = SectionModel(id: 0, text: '').obs;
  Rx<bool> loading = true.obs;
  // Rx<Widget> widget = CircularProgressIndicator().obs;
}