import 'package:essential/core/utils/constants.dart';
import 'package:essential/core/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

showAddDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AddDialog();
    },
  );
}

class AddDialog extends StatefulWidget {
  const AddDialog({
    super.key,
  });

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      title: const Text(
        'Add insights',
        style: TextStyle(
          color: Colors.white38,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              isActive = !isActive;
              setState(() {});
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _option(
                    'Expenses',
                    const Color.fromARGB(255, 233, 176, 172),
                    !isActive,
                  ),
                  const SizedBox(width: 5),
                  _option(
                    'Incomes',
                    const Color.fromARGB(255, 180, 224, 182),
                    isActive,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          _insightsForm(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  FormBuilder _insightsForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FormBuilderTextField(
              name: InsightsFormKeys.amount,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FormBuilderTextField(
              name: InsightsFormKeys.amount,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _option(String title, Color color, bool isActive) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : color,
          ),
        ),
      ),
    );
  }
}
