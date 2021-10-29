import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mct_task/utils/routes.dart';
import 'package:mct_task/utils/service_locator.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/web_api/_web_api.dart';

class RegisterViewModel {
  UserWebApi _api = serviceLocator<UserWebApi>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rolesCheckBoxValue = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final roles = [];

  Future<void> register(
    BuildContext context,
    List<String> roles,
  ) async {
    if (formKey.currentState!.validate()) {
      if (roles.isNotEmpty) {
        final response = await _api.register(nameController.text,
            emailController.text, passwordController.text, roles);
        if (response == null) {
          SomeConsts.popUps.showSnackBar('Something is wrong');
        } else if (response.statusCode == 200 &&
            response.data['responseCode'] == 1) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        } else {
          SomeConsts.popUps
              .showSnackBar('problem: it may be invalid email or password!');
        }
      } else {
        SomeConsts.popUps.showSnackBar('you should select a role');
      }
    }
  }

  Future<List> getRoles() async {
    final response = await _api.getRoles();
    if (response?.statusCode == 200) {
      return response?.data['dateSet'];
    } else {
      print(response?.statusCode);
      print(response?.data);
      throw 'error on loading roles';
    }
  }
}
