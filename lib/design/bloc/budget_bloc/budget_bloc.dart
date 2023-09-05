import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(BudgetDataState(expense: 0, income: 0, savings: 0)) {
    on<BudgetEvent>((event, emit) {
      if (event is AddIncome) {
        final currentData = state as BudgetDataState;

        double income = double.parse(event.income);

        emit(BudgetDataState(
          expense: currentData.expense,
          income: currentData.income + _toPositive(income),
          savings: currentData.savings,
        ));
      } else if (event is AddExpense) {
        final currentData = state as BudgetDataState;

        double expense = double.parse(event.expense);

        emit(BudgetDataState(
          expense: currentData.expense + _toPositive(expense),
          income: currentData.income,
          savings: currentData.savings,
        ));
      } else if (event is AddSavings) {
        final currentData = state as BudgetDataState;

        double savings = double.parse(event.savings);

        emit(BudgetDataState(
          expense: currentData.expense,
          income: currentData.income,
          savings: currentData.savings + _toPositive(savings),
        ));
      }
    });
  }

  _toPositive(double value) {
    if (value < 0) {
      return value * -1;
    }

    return value;
  }
}
