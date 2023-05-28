import 'package:get/state_manager.dart';
import 'package:secrets_website/locator.dart';
import 'package:secrets_website/services/navigation_service.dart';
import 'package:secrets_website/services/routing/routes.dart';

class  InfoScreenController extends GetxController{
  Rx<bool> loading = true.obs;

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToProject(int id) {
    _navigationService.navigateTo(Routes.info);
  }
}