import 'package:flutter/material.dart';
import 'package:mct_task/_shared_widgets/app_drop_down.dart';
import 'package:mct_task/_shared_widgets/key_value.dart';
import 'package:mct_task/models/payment.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/view_model/hala_payment_viewmodel.dart';
import 'package:provider/provider.dart';

class HalaPaymentView extends StatelessWidget {
  const HalaPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HalaPaymentViewModel>(
      create: (context) => HalaPaymentViewModel(),
      builder: (context, child) {
        final provider = context.read<HalaPaymentViewModel>();
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        size: 30,
                      ),
                      color: SomeConsts.colors.mainColor,
                      onPressed: null,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'مدفوعات هلا',
                      style: TextStyle(
                          color: SomeConsts.colors.mainColor, fontSize: 30),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Card(
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_alt_rounded,
                          size: 30,
                        ),
                        color: SomeConsts.colors.mainColor,
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
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
                                style: TextStyle(
                                    color: SomeConsts.colors.greenColor),
                              ),
                              Selector<HalaPaymentViewModel, double>(
                                selector: (_, provider) => provider.total,
                                builder: (context, total, child) => Text(
                                  total.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: SomeConsts.colors.greenColor),
                                ),
                              ),
                              Text(
                                'ريال سعودي',
                                style: TextStyle(
                                    color: SomeConsts.colors.greenColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: FutureBuilder<List>(
                    future: provider.getPayment(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final paymentItem =
                                snapshot.data![index] as Payment;
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ExpansionTile(
                                trailing: null,
                                leading: null,
                                title: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          paymentItem.fullNameAR ??
                                              paymentItem.fullNameEN,
                                          style: TextStyle(
                                            color: SomeConsts.colors.mainColor,
                                          ),
                                        ),
                                        Text(
                                          paymentItem.mobileNumber,
                                          style: TextStyle(
                                            color:
                                                SomeConsts.colors.darkGreyColor,
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
                                          style: TextStyle(
                                              color: SomeConsts
                                                  .colors.lightGreyColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                children: [
                                  KeyValueWidget(
                                      ':رقم التحويل', paymentItem.trxRef),
                                  KeyValueWidget(
                                      ':تاريخ التحويل', paymentItem.trxDate),
                                  KeyValueWidget(':اسم المنشأة',
                                      paymentItem.corporateFullNameAR),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.block_rounded,
                                color: SomeConsts.colors.mainColor,
                                size: 200,
                              ),
                              Text(snapshot.error.toString())
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: SomeConsts.colors.mainColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
