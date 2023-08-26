part of 'incomes_bloc.dart';

abstract class IncomesEvent {}

final class AddIncomesEvent extends IncomesEvent {
  final String incomes;

  AddIncomesEvent(this.incomes);
}
