import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? isSecure;
  const AppTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.controller,
    this.inputType,
    this.isSecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      validator: validator,
      controller: controller,
      obscureText: isSecure ?? false,
      keyboardType: inputType,
    );
  }
}
