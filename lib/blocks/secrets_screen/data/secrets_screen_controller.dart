import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:secrets_website/locator.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/services/api.dart';
import 'package:secrets_website/services/navigation_service.dart';
import 'package:secrets_website/services/routing/routes.dart';

class SecretsScreenController extends GetxController{
  List<SecretsScreenSecretModel> secretsScreenSecretModelList = [];
  Rx<bool> loading = true.obs;

  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToProject(int id) {
    _navigationService.navigateTo(Routes.sections , queryParams: {'id' : id.toString()});
  }
}