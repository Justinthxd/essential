part of 'budget_bloc.dart';

@immutable
sealed class BudgetState {}

final class BudgetInitialState extends BudgetState {}

final class BudgetDataState extends BudgetState {
  final double income;
  final double expense;
  final double savings;

  BudgetDataState({
    required this.income,
    required this.expense,
    required this.savings,
  });
}
