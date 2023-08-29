import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/dictionary.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:essential/design/bloc/budget_bloc/budget_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentBudget extends StatelessWidget {
  const CurrentBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cakeColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Budget',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black45,
            ),
          ),
          BlocBuilder<BudgetBloc, BudgetState>(
            builder: (context, state) {
              if (state is BudgetDataState) {
                return Row(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      calculateAmount(state.income, state.expense),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      CurrencyKeys.dop,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.arrow_drop_up_rounded,
          //       size: 30,
          //       color: Colors.green.withOpacity(0.8),
          //     ),
          //     Text(
          //       '\$1,125',
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.green.withOpacity(0.8),
          //         fontWeight: FontWeight.w800,
          //       ),
          //     ),
          //     const SizedBox(width: 5),
          //     const Text(
          //       'Last month',
          //       style: TextStyle(
          //         fontSize: 15,
          //         color: Colors.black38,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
