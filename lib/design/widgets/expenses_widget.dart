import 'package:essential/core/utils/constants.dart';
import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(20),
          color: cakeColor,
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
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '\$250',
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
