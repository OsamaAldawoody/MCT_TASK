import 'package:flutter/material.dart';
import 'package:mct_task/utils/some_consts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const AppButton(
    this.text, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => SomeConsts.colors.mainColor)),
    );
  }
}
