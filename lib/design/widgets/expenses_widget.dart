import 'package:essential/core/utils/constants.dart';
import 'package:essential/design/bloc/budget_bloc/budget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: pinkColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Expenses',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 5),
            BlocBuilder<BudgetBloc, BudgetState>(
              builder: (context, state) {
                if (state is BudgetDataState) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '\$ ${state.expense}',
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  );
                }
                return Text(
                  '\$ 0',
                  style: TextStyle(
                    fontSize: 29,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w800,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
