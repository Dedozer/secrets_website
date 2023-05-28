import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/components/widgets/icon_back.dart';
import 'package:secrets_website/components/widgets/navbar_items.dart';

class MainAppBar extends AppBar {
  final bool backFlag;
  final bool drawerFlag;
  final GlobalKey<ScaffoldState>? globalKey;
  MainAppBar({
    super.key,
    this.backFlag = true,
    this.drawerFlag = false,
    this.globalKey,
  }) : super(
          actions: NavBarItems.navBarList,
          leading: (backFlag)
              ? IconBack(
                onPressed: () {
                  Get.delete<SectionsScreenController>();
                  Navigator.of(Get.context!).pop();
                },
              )
              : (drawerFlag)
                  ? IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (globalKey != null) {
                        globalKey.currentState!.openDrawer();
                      }
                    },
                  )
                  : Container(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            side: BorderSide(
              color: Colors.black87,
              width: 1,
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 50,
          leadingWidth: 55,
          elevation: 0,
          centerTitle: true,
        );
}
