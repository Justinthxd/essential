import 'package:flutter/material.dart';

class InsightModel {
  final String amount;
  final String description;
  final String date;
  final IconData icon;

  InsightModel({
    this.amount = '0',
    this.description = '',
    this.date = '',
    this.icon = Icons.add_circle_outline_sharp,
  });

  InsightModel copyWith({
    String? amount,
    String? description,
    String? date,
    IconData? icon,
  }) {
    return InsightModel(
      amount: amount ?? this.amount,
      description: description ?? this.description,
      date: date ?? this.date,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'description': description,
      'date': date,
      'icon': icon.codePoint,
    };
  }

  factory InsightModel.fromJson(Map<String, dynamic> json) {
    return InsightModel(
      amount: json['amount'],
      description: json['description'],
      date: json['date'],
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    );
  }

  @override
  String toString() {
    return 'InsightModel(amount: $amount, description: $description, date: $date, icon: ${String.fromCharCode(icon.codePoint)})';
  }
}
