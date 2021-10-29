import 'package:get_it/get_it.dart';
import 'package:mct_task/storage/_local_storage.dart';
import 'package:mct_task/storage/local_storage_impl.dart';
import 'package:mct_task/web_api/payment_api_impl.dart';
import 'package:mct_task/web_api/user_api_impl.dart';
import 'package:mct_task/web_api/_web_api.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // api locator
  serviceLocator.registerLazySingleton<UserWebApi>(() => UserApiImpl());
  serviceLocator.registerLazySingleton<PaymentWebApi>(() => PaymentApiImpl());
// serviceLocator.registerLazySingleton<ReportsWebApi>(() => UserApiImpl());

  // storage locator
  serviceLocator.registerLazySingleton<LocalStorage>(() => LocaleStorageImpl());
}
