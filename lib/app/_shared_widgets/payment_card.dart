import 'package:flutter/material.dart';
import 'package:mct_task/app/models/payment.dart';
import 'package:mct_task/utils/some_consts.dart';

import 'key_value.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.paymentItem,
  }) : super(key: key);

  final Payment paymentItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        trailing: null,
        leading: null,
        title: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  paymentItem.fullNameAR ?? paymentItem.fullNameEN,
                  style: TextStyle(
                    color: SomeConsts.colors.mainColor,
                  ),
                ),
                Text(
                  paymentItem.mobileNumber,
                  style: TextStyle(
                    color: SomeConsts.colors.darkGreyColor,
                  ),
                ),
              ],
            ),
            Column(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  paymentItem.amount.toString(),
                  style: TextStyle(
                      color: Colors.red[400],
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
                Text(
                  'ريال سعودي',
                  style: TextStyle(color: SomeConsts.colors.lightGreyColor),
                ),
              ],
            ),
          ],
        ),
        children: [
          KeyValueWidget(':رقم التحويل', paymentItem.trxRef),
          KeyValueWidget(':تاريخ التحويل', paymentItem.trxDate),
          KeyValueWidget(':اسم المنشأة', paymentItem.corporateFullNameAR),
        ],
      ),
    );
  }
}
