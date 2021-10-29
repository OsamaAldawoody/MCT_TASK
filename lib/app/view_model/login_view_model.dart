import 'package:flutter/material.dart';
import 'package:mct_task/services/storage/_local_storage.dart';
import 'package:mct_task/services/web_api/_web_api.dart';
import 'package:mct_task/utils/routes.dart';
import 'package:mct_task/services/service_locator.dart';
import 'package:mct_task/utils/some_consts.dart';

class LoginViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserWebApi _api = serviceLocator<UserWebApi>();
  LocalStorage _storage = serviceLocator<LocalStorage>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final response = await _api.login(
        emailController.text,
        passwordController.text,
      );
      if (response == null) {
        SomeConsts.popUps.showSnackBar('Something is wrong');
      } else if (response.statusCode == 200 &&
          response.data['responseCode'] == 1) {
        print(response.data['dateSet']['token']);
        _storage.saveToken(response.data['dateSet']['token']);
        Navigator.pushNamed(context, Routes.halaPaymentRoute);
      } else {
        SomeConsts.popUps.showSnackBar(response.data['responseMessage']);
      }
    }
  }
}
