import 'package:flutter/material.dart';
import 'package:mct_task/app/view_model/hala_payment_viewmodel.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:provider/provider.dart';

class TotalPayment extends StatelessWidget {
  const TotalPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'إجمالي المدفوعات',
                style: TextStyle(color: SomeConsts.colors.greenColor),
              ),
              Selector<HalaPaymentViewModel, double>(
                selector: (_, provider) => provider.total,
                builder: (context, total, child) => Text(
                  total.toStringAsFixed(2),
                  style: TextStyle(color: SomeConsts.colors.greenColor),
                ),
              ),
              Text(
                'ريال سعودي',
                style: TextStyle(color: SomeConsts.colors.greenColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
