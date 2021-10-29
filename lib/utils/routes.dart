import 'package:flutter/cupertino.dart';
import 'package:mct_task/view/hala_payment_view.dart';
import 'package:mct_task/view/login_view.dart';
import 'package:mct_task/view/resgister_view.dart';

class Routes {
  static const String initailRoute = '/';
  static const String loginRoute = 'login-route';
  static const String registerRoute = 'register-route';
  static const String halaPaymentRoute = 'hala-payment-route';

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.initailRoute: (ctx) => LoginView(),
    Routes.loginRoute: (ctx) => LoginView(),
    Routes.registerRoute: (ctx) => RegisterView(),
    Routes.halaPaymentRoute: (ctx) => HalaPaymentView(),
  };
}
