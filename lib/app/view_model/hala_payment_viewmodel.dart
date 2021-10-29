import 'package:flutter/cupertino.dart';
import 'package:mct_task/app/models/payment.dart';
import 'package:mct_task/services/service_locator.dart';
import 'package:mct_task/services/web_api/_web_api.dart';

class HalaPaymentViewModel with ChangeNotifier {
  PaymentWebApi _api = serviceLocator<PaymentWebApi>();
  double total = 0;

  Future<List> getPayment() async {
    final response = await _api.getPayment();
    if (response.statusCode == 200) {
      if (response.data['responseCode'] == 1) {
        final payments = response.data['dateSet']
            .map((payment) => Payment.fromJson(payment))
            .toList();
        calcTotal(payments);
        return payments;
      } else {
        throw response.data['responseMessage'];
      }
    } else {
      throw 'error occured on loading payment';
    }
  }

  void calcTotal(List payments) {
    for (var item in payments) {
      total += item.amount;
    }
    print(total);
    notifyListeners();
  }

  final days = [
    'اليوم',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30'
  ];

  final months = [
    'الشهر',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  final years = [
    'السنة',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
  ];
}
