import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  AppDropDownButton({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<String> items;

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  late String dropDownValue;
  @override
  void initState() {
    dropDownValue = widget.items[0];
    super.initState();
  }

  void onChange(String val) {
    setState(() {
      dropDownValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      onChanged: (val) => onChange(val!),
      items: widget.items
          .map(
            (day) => DropdownMenuItem(
              value: day,
              child: Text(day),
            ),
          )
          .toList(),
    );
  }
}
