import 'package:essential/core/utils/constants.dart';
import 'package:essential/design/widgets/current_budget.dart';
import 'package:essential/design/widgets/expenses_widget.dart';
import 'package:essential/design/widgets/incomes_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Essential',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bar_chart_rounded,
              color: Colors.white54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white54,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CurrentBudget(),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  ExpensesWidget(),
                  SizedBox(width: 15),
                  IncomesWidget(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                'Insights',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: Center(
                child: Text(
                  'No insights',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        onPressed: () {
          context.pushNamed('/add');
        },
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
