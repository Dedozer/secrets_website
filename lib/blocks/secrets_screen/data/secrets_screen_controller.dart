import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:secrets_website/models/secrets_screen_secrets_model.dart';
import 'package:secrets_website/services/api.dart';

class SecretsScreenController extends GetxController{
  List<SecretsScreenSecretModel> secretsScreenSecretModelList = [];
  Rx<bool> loading = true.obs;
}