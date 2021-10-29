import 'package:flutter/material.dart';
import 'package:mct_task/app/_shared_widgets/app_drop_down.dart';
import 'package:mct_task/app/_shared_widgets/dialog_filter.dart';
import 'package:mct_task/app/_shared_widgets/key_value.dart';
import 'package:mct_task/app/_shared_widgets/payment_card.dart';
import 'package:mct_task/app/_shared_widgets/total_payment.dart';
import 'package:mct_task/app/models/payment.dart';
import 'package:mct_task/app/view_model/hala_payment_viewmodel.dart';
import 'package:mct_task/utils/some_consts.dart';
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
                            content: DialogFilter(provider: provider),
                          ),
                        ),
                      ),
                    ),
                    TotalPayment()
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
                            return PaymentCard(paymentItem: paymentItem);
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
