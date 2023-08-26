// ignore_for_file: public_member_api_docs, sort_constructors_first

class BudgetModel {
  final String incomes;
  final String expenses;
  final String currentBudget;

  BudgetModel({
    this.incomes = '',
    this.expenses = '',
    this.currentBudget = '',
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      incomes: json['incomes'] ?? '',
      expenses: json['expenses'] ?? '',
      currentBudget: json['currentBudget'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'incomes': incomes,
      'expenses': expenses,
      'currentBudget': currentBudget,
    };
  }

  BudgetModel copyWith({
    String? incomes,
    String? expenses,
    String? currentBudget,
  }) {
    return BudgetModel(
      incomes: incomes ?? this.incomes,
      expenses: expenses ?? this.expenses,
      currentBudget: currentBudget ?? this.currentBudget,
    );
  }

  @override
  String toString() {
    return 'BudgetModel(incomes: $incomes, expenses: $expenses, currentBudget: $currentBudget)';
  }
}
