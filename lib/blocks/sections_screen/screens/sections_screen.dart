import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/section_screen/screens/section_screen.dart';
import 'package:secrets_website/blocks/sections_screen/data/sections_screen_controller.dart';
import 'package:secrets_website/components/widgets/icon_back.dart';
import 'package:secrets_website/components/widgets/navbar.dart';
import 'package:secrets_website/services/api.dart';
import 'package:secrets_website/services/screens_builder.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    SectionsScreenController sectionsScreenController =
        Get.find<SectionsScreenController>();
    return Obx(
      () => ModalProgressHUD(
          color: Colors.white,
          opacity: 0.6,
          inAsyncCall: sectionsScreenController.loading.value,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          child: Scaffold(
            appBar: MainAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: sectionsScreenController
                                .sectionsScreenSectionsModelList.length,
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing:
                                  MediaQuery.of(context).size.width / 20,
                              mainAxisSpacing: 30,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.black87,
                                    width: 1,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    SectionsScreenControllerRouter
                                        sectionsScreenControllerRouter =
                                        SectionsScreenControllerRouter();
                                    sectionsScreenControllerRouter
                                        .navigateToProject(
                                            id,
                                            sectionsScreenController
                                                .sectionsScreenSectionsModelList[
                                                    index]
                                                .id);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => SectionScreen(
                                    //             id: sectionsScreenController
                                    //                 .sectionsScreenSectionsModelList[
                                    //                     index]
                                    //                 .id,
                                    //           )),
                                    // );
                                  },
                                  child: Text(
                                    sectionsScreenController
                                        .sectionsScreenSectionsModelList[index]
                                        .title,
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
    return FutureBuilder(
      future: Api.getSections(id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text('sections'),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: sectionsScreenController
                            .sectionsScreenSectionsModelList.length,
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return TextButton(
                            onPressed: () {
                              ScreensBuilder.sectionScreen(
                                  sectionsScreenController
                                      .sectionsScreenSectionsModelList[index]
                                      .id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SectionsScreen(
                                          id: sectionsScreenController
                                              .sectionsScreenSectionsModelList[
                                                  index]
                                              .id,
                                        )),
                              );
                            },
                            child: Text(sectionsScreenController
                                .sectionsScreenSectionsModelList[index].title),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
