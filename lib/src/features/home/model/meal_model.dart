//{
//"id": "0b40cd00-ff17-49b3-b52f-58ace800c2ff",
//"name": "Janta",
//"hour": 19,
//"minutes": 0,
//"items": []
//}
import 'dart:convert';

import 'package:macros/src/features/home/model/food_model.dart';
import 'package:macros/src/features/home/model/item_model.dart';

class MealModel {
  final String id;
  final String name;
  final double hour;
  final double minutes;
  List<ItemModel> items;

  MealModel({
    required this.id,
    required this.name,
    required this.hour,
    required this.minutes,
    required this.items,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'hour': hour,
        'minutes': minutes,
        'items': items.map((e) => e.toMap()).toList(),
      };

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'],
      name: map['name'],
      minutes: double.tryParse(map['minutes'].toString()) ?? 0,
      hour: double.tryParse(map['hour'].toString()) ?? 0,
      items: (map['items'] as List)
          .map(
            (e) => ItemModel(
              id: e['id'],
              amount: double.tryParse(e['amount'].toString()) ?? 0,
              food: FoodModel.fromMap(e['food']),
            ),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());
}

/* 
return MealModel(
      id: map['id'],
      name: map['name'],
      minutes: double.tryParse(map['minutes'].toString()) ?? 0,
      hour: double.tryParse(map['hour'].toString()) ?? 0,
      items: (map['items'] as List)
          .map(
            (e) => ItemModel(
              id: e['id'],
              amount: double.tryParse(e['amount'].toString()) ?? 0,
              food: FoodModel(
                id: '',
                name: '',
                kcal: 0,
                carb: 0,
                prot: 0,
                fat: 0,
                fiber: 0,
                liquid: false,
              ),
            ),
          )
          .toList(),
    );
 */