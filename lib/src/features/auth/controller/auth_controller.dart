import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:macros/src/helpers/dio_helper.dart';
import 'package:macros/src/helpers/shared_helper.dart';
import 'package:macros/src/features/auth/model/auth_exception.dart';
import 'package:macros/src/features/auth/model/auth_request_model.dart';
import 'package:macros/src/features/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  UserModel? globalUserModel;
  // AuthRequestModel authRequest = AuthRequestModel(email: '', password: '');

  String? errorText;

  bool get isAuthenticated => globalUserModel != null;

  bool isLoading = false;

  Future<bool> login({required String email, required String password}) async {
    
    isLoading = true;
    notifyListeners();

    if (email != '' && password != '') {
      try {
        AuthRequestModel authRequest =
            AuthRequestModel(email: email, password: password);

        final Response res = await DioHelper.login(authRequest);

        //----------------------
        UserModel user = UserModel.fromMap(res.data);
        //----------------------

        errorText = await SharedHelper.setGlobalUser(user);

        if (errorText == null) {
          globalUserModel = user;
        }

        isLoading = false;
        notifyListeners();
        return errorText == null;
      } on DioError catch (dioError) {
        final Response<dynamic> error = dioError.response!;
        final data = json.decode(error.toString()) as Map<String, dynamic>;
        errorText = data['error'].toString();
        isLoading = false;
        notifyListeners();
        return false;
      } catch (e) {
        errorText = e.toString();
        isLoading = false;
        notifyListeners();
        return false;
      }
    }
    errorText = 'Preencha os campos';
    isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> tryAutoLogin() async {
    // await Future.delayed(const Duration(seconds: 1));

    final shared = await SharedPreferences.getInstance();

    if (!shared.containsKey('UserData')) {
      return false;
    }

    try {
      final str = shared.getString('UserData') ?? '';
      final data = await json.decode(str);

      globalUserModel = UserModel(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        token: data['token'],
      );

      notifyListeners();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final res = await SharedHelper.clearGlobalUser();

      if (res == null) {
        globalUserModel = null;
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        throw AuthException(res);
      }
    } catch (e) {
      notifyListeners();
      return false;
    }
  }
}
