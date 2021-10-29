import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:mct_task/utils/some_consts.dart';

import '_web_api.dart';

class UserApiImpl implements UserWebApi {
  final _registerRoute = '/User/RegisterUser';
  final _loginRoute = '/User/Login';
  final _rolesRoute = '/User/GetRoles';

  Dio dio = new Dio(
    BaseOptions(
      baseUrl: SomeConsts.constTexts.baseRoute,
      contentType: 'application/json',
    ),
  );

  @override
  Future<Response?> getRoles() async {
    try {
      final response = await dio.get('$_rolesRoute');
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<Response?> login(String email, String password) async {
    final formData = jsonEncode({
      'email': email,
      'password': password,
    });
    try {
      final response = await dio.post(
        '$_loginRoute',
        data: formData,
      );
      print(response.realUri);
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<Response?> register(
    String fullName,
    String email,
    String password,
    List<String> roles,
  ) async {
    try {
      final body = jsonEncode({
        'fullName': fullName,
        'email': email,
        'password': password,
        'roles': roles
      });
      final response = await dio.post(
        '$_registerRoute',
        data: body,
      );
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
