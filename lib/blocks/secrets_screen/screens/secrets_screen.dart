import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:secrets_website/blocks/secrets_screen/data/secrets_screen_controller.dart';
import 'package:secrets_website/blocks/section_screen/screens/section_screen.dart';
import 'package:secrets_website/blocks/sections_screen/screens/sections_screen.dart';
import 'package:secrets_website/components/widgets/navbar.dart';
import 'package:secrets_website/services/api.dart';
import 'package:secrets_website/services/navigation_service.dart';
import 'package:secrets_website/services/screens_builder.dart';
import 'package:secrets_website/services/screens_controller.dart';

class SecretsScreen extends StatelessWidget {
  const SecretsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SecretsScreenController secretsScreenController =
        Get.find<SecretsScreenController>();
    return Obx(
      () => ModalProgressHUD(
          color: Colors.white,
          opacity: 0.6,
          inAsyncCall: secretsScreenController.loading.value,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          child: Scaffold(
            appBar: MainAppBar(
              backFlag: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: secretsScreenController
                              .secretsScreenSecretModelList.length,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                  secretsScreenController.navigateToProject(
                                      secretsScreenController
                                          .secretsScreenSecretModelList[index]
                                          .id);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SectionsScreen(
                                  //             id: secretsScreenController
                                  //                 .secretsScreenSecretModelList[index]
                                  //                 .id,
                                  //           )),
                                  // );
                                },
                                child: Wrap(
                                  children: [
                                    Text(
                                      secretsScreenController
                                          .secretsScreenSecretModelList[index]
                                          .title,
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
    return FutureBuilder(
      future: Api.getSecrets(),
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
                      child: Text('tabs'),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: secretsScreenController
                          .secretsScreenSecretModelList.length,
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
                            ScreensBuilder.sectionsScreen(
                                secretsScreenController
                                    .secretsScreenSecretModelList[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SectionScreen(
                                        id: secretsScreenController
                                            .secretsScreenSecretModelList[index]
                                            .id,
                                      )),
                            );
                          },
                          child: Text(secretsScreenController
                              .secretsScreenSecretModelList[index].title),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
