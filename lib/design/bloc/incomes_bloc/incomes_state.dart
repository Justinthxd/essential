part of 'incomes_bloc.dart';

abstract class IncomesState {}

final class IncomesInitialState extends IncomesState {}

final class AddIncomesState extends IncomesState {
  final BudgetModel incomes;

  AddIncomesState(this.incomes);
}
