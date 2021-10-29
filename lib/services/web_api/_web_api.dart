import 'package:dio/dio.dart';

abstract class UserWebApi {
  Future<Response?> register(
    String fullName,
    String email,
    String password,
    List<String> roles,
  );
  Future<Response?> login(String email, String password);
  Future<Response?> getRoles();
}

abstract class ReportsWebApi {}

abstract class PaymentWebApi {
  Future<Response> getPayment();
}
