import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:essential/data/models/category_model.dart';
import 'package:essential/data/models/insight_model.dart';
import 'package:essential/design/bloc/budget_bloc/budget_bloc.dart';
import 'package:essential/design/bloc/category_bloc/category_bloc.dart';
import 'package:essential/design/bloc/insights_bloc/insights_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormBuilderState>();

  String currentValue = InsightsOptionsKeys.incomes;

  final TextEditingController searchFolder = TextEditingController();

  bool isActive = false;

  final FocusNode _focus = FocusNode();

  String currentCategory = 'Category';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formKey.currentState!.fields[InsightsFormKeys.amount]!.focus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white54,
          ),
        ),
        title: const Text(
          'Add',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<CategoryBloc>()
                  .add(AddCategoryEvent(const CategoryModel(title: 'Family')));
            },
            icon: const Icon(
              Icons.folder_copy_rounded,
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
      body: SingleChildScrollView(
        child: Container(
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
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
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
                      final newInsight = InsightModel(
                        amount: _formKey
                            .currentState!.value[InsightsFormKeys.amount],
                        date: DateTime.now().toString(),
                        description: _formKey.currentState!
                                .value[InsightsFormKeys.description] ??
                            '',
                        category: CategoryModel(title: currentCategory),
                      );
                      context
                          .read<InsightsBloc>()
                          .add(AddInsightEvent(newInsight));

                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 72, 86, 68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 87, 38, 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              onTapOutside: (event) => _focus.unfocus(),
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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionPanelList(
              elevation: 0,
              expansionCallback: (panelIndex, isExpanded) {
                isActive = !isActive;
                setState(() {});
              },
              expandIconColor: Colors.white38,
              children: [
                ExpansionPanel(
                  isExpanded: isActive,
                  backgroundColor: Colors.white.withOpacity(0.03),
                  headerBuilder: (context, isExpanded) {
                    return !isExpanded
                        ? ListTile(
                            onTap: () {
                              isActive = !isActive;
                              setState(() {});
                            },
                            tileColor: Colors.transparent,
                            title: Text(
                              currentCategory,
                              style: TextStyle(
                                fontSize: 18,
                                color: currentCategory != 'Default'
                                    ? Colors.white
                                    : Colors.white60,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              controller: searchFolder,
                              onTapOutside: (event) => _focus.unfocus(),
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          );
                  },
                  body: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoadedState) {
                        return SizedBox(
                          height: 120,
                          child: Scrollbar(
                            thickness: 10,
                            interactive: true,
                            child: ListView.builder(
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) {
                                final category = state.categories[index];
                                return ListTile(
                                  tileColor: Colors.transparent,
                                  title: Text(
                                    category.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    currentCategory = category.title;
                                    isActive = !isActive;
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
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
              onTapOutside: (event) => _focus.unfocus(),
            ),
          ),
        ],
      ),
    );
  }
}
