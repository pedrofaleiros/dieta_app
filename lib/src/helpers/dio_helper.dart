import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:macros/src/features/auth/model/auth_request_model.dart';
import 'package:macros/src/features/home/model/meal_model.dart';

class DioHelper {
  static const url = 'http://172.30.129.176:3333';

  static Future<Response> login(AuthRequestModel req) async {
    final Response res = await Dio().post(
      '$url/session',
      data: req.toMap(),
      options: Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }),
    );

    return res;
  }

  static Future<void> loadFoods() async {
    try {
      final Response res = await Dio().get('$url/food');

      print(res.data[0]);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> loadMeals(String token) async {
    // try {
    final res = await Dio().get(
      '$url/meal',
      options: Options(headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      }),
    );

    final data = json.encode(res.data[0]);

    MealModel meal = MealModel.fromMap(json.decode(data));
    print(meal.toJson());

    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
