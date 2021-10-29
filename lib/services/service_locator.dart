import 'package:get_it/get_it.dart';

import 'storage/_local_storage.dart';
import 'storage/local_storage_impl.dart';
import 'web_api/_web_api.dart';
import 'web_api/payment_api_impl.dart';
import 'web_api/user_api_impl.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // api locator
  serviceLocator.registerLazySingleton<UserWebApi>(() => UserApiImpl());
  serviceLocator.registerLazySingleton<PaymentWebApi>(() => PaymentApiImpl());
// serviceLocator.registerLazySingleton<ReportsWebApi>(() => UserApiImpl());

  // storage locator
  serviceLocator.registerLazySingleton<LocalStorage>(() => LocaleStorageImpl());
}
