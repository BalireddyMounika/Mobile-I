import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/User.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/login_request.dart';
import 'package:prasada_political_portfolio/app/data/repository/auth_repository.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class LoginController extends BaseController<AuthRepository> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isObscurePassword = RxBool(true);

  @override
  void onInit() {
    super.onInit();
  }

  login() async {
    // Get.offAndToNamed(Routes.HOME);

    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      LoadingUtils.showLoader();

      LoginRequest loginCredential = LoginRequest(
          email: emailController.text, password: passwordController.text);
      RepoResponse<GenericResponse> response =
          await repository.login(loginCredential);

      if (response.data?.status == 200) {
        User userData = User.fromJson(response.data?.result);
        AppStorage.setUser(userData);
        LoadingUtils.hideLoader();
        // Get.offAndToNamed(Routes.HOME);
        Get.offAndToNamed(Routes.POLLING_DAY_PAGE);
      } else {
        if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
        AppUtils.showSnackBar('${response.error?.message}');
      }
    }
  }

  handelObscurePassword() {
    isObscurePassword.toggle();
  }

  void showErrorMessage(String message) {
    print('messege');
  }
}
