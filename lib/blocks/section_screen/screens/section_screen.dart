import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:secrets_website/blocks/section_screen/data/section_screen_model.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/components/widgets/navbar.dart';
import 'package:secrets_website/locator.dart';
import 'package:secrets_website/services/navigation_service.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key, required this.id});

  final int id;

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SectionsScreenController sectionsScreenController =
        Get.find<SectionsScreenController>();
    SectionScreenController sectionScreenController =
        Get.find<SectionScreenController>();
    return WillPopScope(
      onWillPop: () {
        _scaffoldKey.currentState!.closeDrawer();
        return locator<NavigationService>().goBack();
      },
      child: Obx(
        () => ModalProgressHUD(
            color: Colors.white,
            opacity: 0.6,
            inAsyncCall: sectionScreenController.loading.value &&
                sectionsScreenController.loading.value,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            child: Scaffold(
              key: _scaffoldKey,
              // appBar: MainAppBar(
              //   // backBool: false,
              // ),
              appBar: MainAppBar(
                backFlag: false,
                drawerFlag: true,
                globalKey: _scaffoldKey,
              ),
              drawer: Drawer(
                child: ListView(children: [
                  for (int i = 0;
                      i <
                          sectionsScreenController
                              .sectionsScreenSectionsModelList.length;
                      i++)
                    Column(
                      children: [
                        ListTile(
                          title: Text(sectionsScreenController
                              .sectionsScreenSectionsModelList[i].title),
                          onTap: () {
                            SectionsScreenControllerRouter
                                sectionsScreenControllerRouter =
                                SectionsScreenControllerRouter();
                            sectionsScreenControllerRouter.navigateToProject(
                                widget.id,
                                sectionsScreenController
                                    .sectionsScreenSectionsModelList[i].id);
                            // sectionsScreenController.navigateToProject(
                            //             widget.id,
                            //             sectionsScreenController
                            //                 .sectionsScreenSectionsModelList[sectionsScreenController
                            //     .sectionsScreenSectionsModelList[i].id]
                            //                 .id);
                            //   ScreensBuilder.changeSection(sectionsScreenController
                            //       .sectionsScreenSectionsModelList[i].id);

                            // Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (i !=
                            sectionsScreenController
                                    .sectionsScreenSectionsModelList.length -
                                1)
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                      ],
                    )
                ]),
              ),
              // appBar: AdaptiveNavBar(
              //   screenWidth: MediaQuery.of(context).size.width,
              //   title: const Text("Adaptive NavBar"),
              //   navBarItems: [
              // for (int i = 0;
              //     i <
              //         sectionsScreenController
              //             .sectionsScreenSectionsModelList.length;
              //     i++)
              //   NavBarItem(
              //     text: sectionsScreenController.sectionsScreenSectionsModelList[i].title,
              //     onTap: () {

              //       ScreensBuilder.sectionsScreen(widget.id);
              //       ScreensBuilder.changeSection(sectionsScreenController
              //           .sectionsScreenSectionsModelList[i].id);

              //     },
              //   )
              //   ],
              // ),
              body: Row(
                children: [
                  // SideNavigationBar(
                  //   selectedIndex: selectedIndex,
                  //   items: [
                  //     for (var el in sectionsScreenController
                  //         .sectionsScreenSectionsModelList)
                  //       SideNavigationBarItem(
                  //         icon: Icons.dashboard,
                  //         label: el.title,
                  //       ),
                  //   ],
                  //   // [

                  //   //   SideNavigationBarItem(
                  //   //     icon: Icons.dashboard,
                  //   //     label: 'Dashboard',
                  //   //   ),
                  //   //   SideNavigationBarItem(
                  //   //     icon: Icons.person,
                  //   //     label: 'Account',
                  //   //   ),
                  //   //   SideNavigationBarItem(
                  //   //     icon: Icons.settings,
                  //   //     label: 'Settings',
                  //   //   ),
                  //   // ],
                  //   onTap: (index) {
                  //     setState(() {
                  //       // Get.delete<SectionsScreenController>();
                  //       // ScreensBuilder.sectionsScreen(widget.id);
                  //       // ScreensBuilder.sectionScreen(sectionsScreenController
                  //       //     .sectionsScreenSectionsModelList[index].id);
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //       builder: (context) => SectionScreen(
                  //       //             id: sectionsScreenController
                  //       //                 .sectionsScreenSectionsModelList[index]
                  //       //                 .id,
                  //       //           )),
                  //       // );

                  //       selectedIndex = index;
                  //     });
                  //   },
                  // ),

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
      ),
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
