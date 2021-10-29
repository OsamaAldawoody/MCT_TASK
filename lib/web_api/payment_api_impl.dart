import 'package:dio/dio.dart';
import 'package:mct_task/storage/_local_storage.dart';
import 'package:mct_task/utils/service_locator.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/web_api/_web_api.dart';

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
