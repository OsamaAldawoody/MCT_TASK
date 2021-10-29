import 'package:dio/dio.dart';
import 'package:mct_task/services/service_locator.dart';
import 'package:mct_task/services/storage/_local_storage.dart';
import 'package:mct_task/utils/some_consts.dart';

import '_web_api.dart';

class PaymentApiImpl implements PaymentWebApi {
  final _paymentRoute = '/Payment/GetPayment';

  Dio dio = new Dio(
    BaseOptions(
      baseUrl: SomeConsts.constTexts.baseRoute,
      contentType: 'application/json',
      headers: {
        'Authorization': 'Bearer ${serviceLocator<LocalStorage>().getToken()}'
      },
    ),
  );
  @override
  Future<Response> getPayment() async {
    print(serviceLocator<LocalStorage>().getToken());
    final response = await dio.get('$_paymentRoute');
    return response;
  }
}
