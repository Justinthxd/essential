import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:flutter/material.dart';

showAddBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const CustomBottomSheet(); // Replace with your actual bottom sheet content
    },
  );
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with WidgetsBindingObserver {
  String _selectedMode = RadioKeys.incomes;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final newKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    if (newKeyboardVisible != isKeyboardVisible) {
      setState(() {
        isKeyboardVisible = newKeyboardVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 600,
      width: size.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Text(
            isKeyboardVisible.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              Radio(
                value: RadioKeys.expenses,
                activeColor: Colors.red,
                groupValue: _selectedMode,
                onChanged: (value) {
                  print(value);
                  _selectedMode = value!;
                  setState(() {});
                },
              ),
              const Text(
                'Expenses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Radio(
                value: RadioKeys.incomes,
                activeColor: Colors.green,
                groupValue: _selectedMode,
                onChanged: (value) {
                  _selectedMode = value!;
                  setState(() {});
                },
              ),
              const Text(
                'Incomes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
