import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:essential/design/bloc/budget_bloc/budget_bloc.dart';
import 'package:essential/design/widgets/current_budget.dart';
import 'package:essential/design/widgets/expenses_widget.dart';
import 'package:essential/design/widgets/incomes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(initialPage: 0);
  final _formKey = GlobalKey<FormBuilderState>();

  String currentValue = InsightsOptionsKeys.incomes;

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
            onPressed: () {
              // context.pushNamed('/charts');
            },
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
        child: PageView(
          controller: pageController,
          children: [
            Column(
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
            Container(
              padding: const EdgeInsets.all(17),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        _savingsOption(),
                        const SizedBox(width: 5),
                        _option(
                          'Expenses',
                          const Color.fromARGB(255, 233, 176, 172),
                          InsightsOptionsKeys.expenses,
                        ),
                        const SizedBox(width: 5),
                        _option(
                          'Incomes',
                          const Color.fromARGB(255, 180, 224, 182),
                          InsightsOptionsKeys.incomes,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  _insightsForm(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        onPressed: () {
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );

          if (_formKey.currentState!.saveAndValidate()) {
            final data = _formKey.currentState!.value;
            if (currentValue == InsightsOptionsKeys.incomes) {
              context
                  .read<BudgetBloc>()
                  .add(AddIncome(data[InsightsFormKeys.amount]));
            } else if (currentValue == InsightsOptionsKeys.expenses) {
              context
                  .read<BudgetBloc>()
                  .add(AddExpense(data[InsightsFormKeys.amount]));
            } else if (currentValue == InsightsOptionsKeys.savings) {
              context
                  .read<BudgetBloc>()
                  .add(AddSavings(data[InsightsFormKeys.amount]));
            }
          }
        },
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }

  _savingsOption() {
    bool isActive = false;
    Color color = const Color.fromARGB(255, 233, 226, 172);

    if (currentValue == InsightsOptionsKeys.savings) {
      isActive = true;
    }

    return GestureDetector(
      onTap: () {
        currentValue = InsightsOptionsKeys.savings;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.savings,
          color: isActive ? Colors.black.withOpacity(0.8) : color,
        ),
      ),
    );
  }

  _option(String title, Color color, String key) {
    bool isActive = false;

    if (currentValue == key) {
      isActive = true;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          currentValue = key;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: isActive ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: isActive ? Colors.black : color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _insightsForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FormBuilderTextField(
              name: InsightsFormKeys.amount,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                border: InputBorder.none,
              ),
              onTapOutside: (event) {},
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amount';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FormBuilderTextField(
              name: InsightsFormKeys.description,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                border: InputBorder.none,
              ),
              onTapOutside: (event) {},
            ),
          ),
        ],
      ),
    );
  }
}
