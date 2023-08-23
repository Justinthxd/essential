import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:flutter/material.dart';

class CurrentBudget extends StatelessWidget {
  const CurrentBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
          Row(
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
                '1,250',
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
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_drop_up_rounded,
                size: 30,
                color: Colors.green.withOpacity(0.8),
              ),
              Text(
                '\$1,125',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green.withOpacity(0.8),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Last month',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
