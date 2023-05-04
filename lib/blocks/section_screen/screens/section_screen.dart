import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/components/widgets/icon_back.dart';
import 'package:secrets_website/components/widgets/navbar.dart';
import 'package:secrets_website/models/section_model.dart';
import 'package:secrets_website/services/api.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:secrets_website/services/screens_builder.dart';
import 'package:side_navigation/side_navigation.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key, required this.id});

  final int id;

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SectionsScreenController sectionsScreenController =
        Get.find<SectionsScreenController>();
    SectionScreenController sectionScreenController =
        Get.find<SectionScreenController>();
    return Obx(
      () => ModalProgressHUD(
          color: Colors.white,
          opacity: 0.6,
          inAsyncCall: sectionScreenController.loading.value &&
              sectionsScreenController.loading.value,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          child: Scaffold(
            appBar: AppBar(
              actions: NavBar.navBarList,
              leading: IconBack(
                onPressed: () {
                  Get.delete<SectionScreenController>();
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Row(
              children: [
                SideNavigationBar(
                  selectedIndex: selectedIndex,
                  items: [
                  for(var el in sectionsScreenController.sectionsScreenSectionsModelList)
                  SideNavigationBarItem(
                      icon: Icons.dashboard,
                      label: el.title,
                    ),
                  ],
                  // [

                  //   SideNavigationBarItem(
                  //     icon: Icons.dashboard,
                  //     label: 'Dashboard',
                  //   ),
                  //   SideNavigationBarItem(
                  //     icon: Icons.person,
                  //     label: 'Account',
                  //   ),
                  //   SideNavigationBarItem(
                  //     icon: Icons.settings,
                  //     label: 'Settings',
                  //   ),
                  // ],
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),

                /// Pretty similar to the BottomNavigationBar!

                /// Make it take the rest of the available width
                Expanded(
                  child: Markdown(
                    data: sectionScreenController.sectionModel.value!.text,
                  ),
                )
              ],
            ),
          )),
    );
    // return FutureBuilder(
    //     future: Api.getSection(id),
    //     builder: (context, AsyncSnapshot<List<SectionModel>> snapshot) {
    //       if (snapshot.hasData) {
    //         // return Markdown(data: sectionScreenController.sectionModel[0].text);
    //         return Container();
    //       } else {
    //         return CircularProgressIndicator();
    //       }
    //     });
  }
}
