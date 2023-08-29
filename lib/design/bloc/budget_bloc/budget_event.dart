part of 'budget_bloc.dart';

@immutable
sealed class BudgetEvent {}

class AddIncome extends BudgetEvent {
  final String income;

  AddIncome(this.income);
}

class AddExpense extends BudgetEvent {
  final String expense;

  AddExpense(this.expense);
}

class AddSavings extends BudgetEvent {
  final String savings;

  AddSavings(this.savings);
}
