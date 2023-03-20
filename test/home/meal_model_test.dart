import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:macros/src/features/home/model/food_model.dart';
import 'package:macros/src/features/home/model/item_model.dart';
import 'package:macros/src/features/home/model/meal_model.dart';
import 'dart:ui' as ui;

void main() {
  MealModel meal = MealModel(
    id: '1',
    name: 'meal 1',
    hour: 8,
    minutes: 30,
    items: <ItemModel>[
      ItemModel(
        id: '101',
        amount: 100,
        food: FoodModel(
          id: '1001',
          name: 'food 1',
          kcal: 300,
          carb: 30,
          prot: 22,
          fat: 3,
          fiber: 0,
          liquid: false,
        ),
      ),
    ],
  );

  String str = '''{"id":"101","amount":100.0,"food":{"id":"1001","name":"food 1","kcal":300.0,"carb":30.0,"prot":22.0,"fat":3.0,"fiber":0.0,"liquid":false}}''';
  // ItemModel item = ItemModel.fromJson();

  print(meal.items[0].toJson());
}
