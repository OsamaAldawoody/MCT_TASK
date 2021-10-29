import 'package:flutter/material.dart';
import 'package:mct_task/app/_shared_widgets/app_button.dart';
import 'package:mct_task/app/_shared_widgets/role_checkbox.dart';

import 'package:mct_task/app/view_model/register_view_model.dart';
import 'package:mct_task/utils/routes.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/validation/email_validator.dart';
import 'package:mct_task/validation/name_validator.dart';
import 'package:mct_task/validation/password_validator.dart';

import 'package:provider/provider.dart';

import '../_shared_widgets/app_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<RegisterViewModel>(
        create: (context) => RegisterViewModel(),
        builder: (context, child) {
          final provider = context.read<RegisterViewModel>();
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
                      hintText: 'full name',
                      validator: (val) => FieldValidator(val!).validate(),
                      controller: provider.nameController,
                    ),
                    AppTextFormField(
                      hintText: 'mail@example.com',
                      validator: (val) => EmailValidator(val!).validate(),
                      controller: provider.emailController,
                      inputType: TextInputType.emailAddress,
                    ),
                    AppTextFormField(
                      hintText: '******',
                      validator: (val) => PasswordValidator(val!).validate(),
                      controller: provider.passwordController,
                      isSecure: true,
                    ),
                    FutureBuilder<List>(
                      future: provider.getRoles(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                              children: snapshot.data!
                                  .map((e) => RoleCheckBox(e))
                                  .toList());
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    AppButton('تسجيل', onTap: () {
                      try {
                        provider.register(
                            context, provider.roles.cast<String>());
                      } catch (e) {
                        SomeConsts.popUps.showSnackBar(
                          e.toString(),
                        );
                      }
                    }),
                    AppButton('مسجل بالفعل',
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.loginRoute)),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
