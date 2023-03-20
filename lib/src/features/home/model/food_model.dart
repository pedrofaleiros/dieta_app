//{
// id: 50c4b8b8-e310-4377-8b6c-a91d82514edf
// name: Aveia Quaker
// kcal: 347
// carb: 56.7
// prot: 14.3
// fat: 7.3
// fiber: 10
// liquid: false
// }

import 'dart:convert';

class FoodModel {
  final String id;
  final String name;
  final double kcal;
  final double carb;
  final double prot;
  final double fat;
  final double fiber;
  final bool liquid;

  FoodModel({
    required this.id,
    required this.name,
    required this.kcal,
    required this.carb,
    required this.prot,
    required this.fat,
    required this.fiber,
    required this.liquid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kcal': kcal,
      'carb': carb,
      'prot': prot,
      'fat': fat,
      'fiber': fiber,
      'liquid': liquid,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) => FoodModel(
        id: map['id'],
        name: map['name'],
        kcal: double.tryParse(map['kcal'].toString()) ?? 0,
        carb: double.tryParse(map['carb'].toString()) ?? 0,
        prot: double.tryParse(map['prot'].toString()) ?? 0,
        fat: double.tryParse(map['fat'].toString()) ?? 0,
        fiber: double.tryParse(map['fiber'].toString()) ?? 0,
        liquid: map['liquid'],
      );

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'],
        name: json['name'],
        kcal: json['kcal'],
        carb: json['carb'],
        prot: json['prot'],
        fat: json['fat'],
        fiber: json['fiber'],
        liquid: json['liquid'],
      );

  String toJson() => json.encode(toMap());
}
