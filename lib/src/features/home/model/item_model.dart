//{
//"id": "cbdf524e-34f3-411d-8336-a679cf776db1",
//"amount": 150,
//"food": {
//  "id": "965f4840-b674-4df1-9830-de3ab33b8bbe",
//  "name": "ovo",
//  "kcal": 148,
//  "carb": 2,
//  "prot": 12.6,
//  "fat": 10,
//  "fiber": 0,
//  "liquid": false
//}
import 'dart:convert';

import 'package:macros/src/features/home/model/food_model.dart';

class ItemModel {
  final String id;
  final double amount;
  final FoodModel food;

  ItemModel({
    required this.id,
    required this.amount,
    required this.food,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'food': food.toMap(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
        id: map['id'],
        amount: map['amount'],
        food: FoodModel.fromMap(map['food']),
      );

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'],
        amount: json['amount'],
        food: FoodModel.fromJson(json['food']),
      );

  String toJson() => json.encode(toMap());
}
