import 'package:flutter/material.dart';
import 'package:mct_task/utils/routes.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/validation/name_validator.dart';
import 'package:mct_task/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../_shared_widgets/app_button.dart';
import '../_shared_widgets/app_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<LoginViewModel>(
        create: (context) => LoginViewModel(),
        builder: (context, child) {
          final provider = context.read<LoginViewModel>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        SomeConsts.assets.logo,
                        width: 100,
                        height: 100,
                      ),
                      AppTextFormField(
                        hintText: 'mail@example.com',
                        controller: provider.emailController,
                        validator: (val) => FieldValidator(val!).validate(),
                      ),
                      AppTextFormField(
                        hintText: '******',
                        controller: provider.passwordController,
                        validator: (val) => FieldValidator(val!).validate(),
                      ),
                      AppButton(
                        'دخول',
                        onTap: () => provider.login(context),
                      ),
                      AppButton(
                        'تسجيل حساب جديد',
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.registerRoute),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
