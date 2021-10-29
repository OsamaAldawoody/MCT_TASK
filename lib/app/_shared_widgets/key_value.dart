import 'package:flutter/material.dart';
import 'package:mct_task/utils/some_consts.dart';

class KeyValueWidget extends StatelessWidget {
  const KeyValueWidget(
    this.wkey,
    this.value, {
    Key? key,
  }) : super(key: key);

  final String wkey;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              wkey,
              style: TextStyle(color: SomeConsts.colors.lightGreyColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: SomeConsts.width * .65,
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: TextStyle(
                color: SomeConsts.colors.darkGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
