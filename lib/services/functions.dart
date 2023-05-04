import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/enums/screens_enum.dart';

class Functions {
  static void loader() {
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            CircularProgressIndicator(),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  static void loaderPop() {
    Navigator.pop(Get.context!);
  }

  static void pageChanger(ScreensEnum screen){
    if(screen == ScreensEnum.secretsScreen){
      
    }
  }
}
