import 'package:flutter/material.dart';
import 'package:mct_task/app/view_model/register_view_model.dart';
import 'package:provider/src/provider.dart';

class RoleCheckBox extends StatefulWidget {
  final String text;
  const RoleCheckBox(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  State<RoleCheckBox> createState() => _RoleCheckBoxState();
}

class _RoleCheckBoxState extends State<RoleCheckBox> {
  bool _val = false;

  void changeVal(bool val, String value) {
    setState(() {
      _val = val;
      if (val) {
        context.read<RegisterViewModel>().roles.add(value);
      } else if (val == false) {
        context.read<RegisterViewModel>().roles.remove(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text),
        Checkbox(
            value: _val,
            onChanged: (bool? val) => changeVal(val!, widget.text)),
      ],
    );
  }
}
