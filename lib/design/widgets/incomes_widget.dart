import 'package:essential/core/utils/constants.dart';
import 'package:essential/design/bloc/budget_bloc/budget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomesWidget extends StatelessWidget {
  const IncomesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: greenColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Incomes',
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
                      '\$ ${state.income}',
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
