import 'package:flutter/material.dart';
import 'package:mct_task/app/view_model/hala_payment_viewmodel.dart';
import 'package:mct_task/utils/some_consts.dart';

import 'app_drop_down.dart';

class DialogFilter extends StatelessWidget {
  const DialogFilter({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final HalaPaymentViewModel provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'من تاريخ',
          style: TextStyle(
            color: SomeConsts.colors.mainColor,
            fontSize: 20,
          ),
        ),
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppDropDownButton(items: provider.days),
            AppDropDownButton(items: provider.months),
            AppDropDownButton(items: provider.years)
          ],
        ),
        Text(
          'إلى تاريخ',
          style: TextStyle(
            color: SomeConsts.colors.mainColor,
            fontSize: 20,
          ),
        ),
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppDropDownButton(items: provider.days),
            AppDropDownButton(items: provider.months),
            AppDropDownButton(items: provider.years)
          ],
        ),
        Container(
          width: SomeConsts.width,
          alignment: Alignment.bottomCenter,
          child: TextButton(
            onPressed: () => null,
            child: Text(
              'بحث',
              style: TextStyle(
                color: Colors.red[500],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
