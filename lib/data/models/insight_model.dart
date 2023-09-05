// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:essential/data/models/category_model.dart';
import 'package:flutter/material.dart';

class InsightModel {
  final String amount;
  final String description;
  final String date;
  final IconData icon;
  final CategoryModel category;

  InsightModel({
    this.amount = '0',
    this.description = '',
    this.date = '',
    this.icon = Icons.add_circle_outline_sharp,
    this.category = const CategoryModel(),
  });

  InsightModel copyWith(
      {String? amount,
      String? description,
      String? date,
      IconData? icon,
      CategoryModel? category}) {
    return InsightModel(
      amount: amount ?? this.amount,
      description: description ?? this.description,
      date: date ?? this.date,
      icon: icon ?? this.icon,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'description': description,
      'date': date,
      'icon': icon.codePoint,
      'category': category,
    };
  }

  factory InsightModel.fromJson(Map<String, dynamic> json) {
    return InsightModel(
      amount: json['amount'],
      description: json['description'],
      date: json['date'],
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      category: json['category'],
    );
  }

  @override
  String toString() {
    return 'InsightModel(amount: $amount, description: $description, date: $date, icon: ${String.fromCharCode(icon.codePoint)} category: $category)';
  }
}
