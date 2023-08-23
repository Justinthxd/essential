import 'package:essential/core/utils/constants.dart';
import 'package:essential/design/widgets/add_sheet.dart';
import 'package:essential/design/widgets/current_budget.dart';
import 'package:essential/design/widgets/expenses_widget.dart';
import 'package:essential/design/widgets/incomes_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/folder_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            const CurrentBudget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                children: [
                  ExpensesWidget(),
                  SizedBox(width: 20),
                  IncomesWidget(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(width: 35),
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  FolderItem(
                    size: size,
                    icon: Icons.percent_rounded,
                    name: 'Sales',
                    description: 'Sinces last week',
                    money: '230k',
                    colorContainer: greenColor,
                  ),
                  FolderItem(
                    size: size,
                    icon: Icons.account_circle_outlined,
                    name: 'Customers',
                    description: 'Sinces last week',
                    money: '8.549k',
                    colorContainer: purpleColor,
                  ),
                  FolderItem(
                    size: size,
                    icon: Icons.category_rounded,
                    name: 'Products',
                    description: 'Products last week',
                    money: '1.423k',
                    colorContainer: cakeColor,
                  ),
                  FolderItem(
                    size: size,
                    icon: Icons.pie_chart_rounded,
                    name: 'Revenue',
                    description: 'Sinces last week',
                    money: '\$ 9745',
                    colorContainer: greenColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        // onPressed: () => showAddDialog(context),
        onPressed: () => showAddBottomSheet(context),
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
