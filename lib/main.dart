import 'package:flutter/material.dart';
import 'package:mct_task/services/service_locator.dart';
import 'package:mct_task/utils/some_consts.dart';
import 'package:mct_task/utils/routes.dart';

void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routes.routes,
      initialRoute: Routes.initailRoute,
      navigatorKey: SomeConsts.navigatorKey,
    );
  }
}
