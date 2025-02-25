import 'package:flutter/material.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';
import 'package:simplumio/widgets/budget_progress.dart';
import 'package:simplumio/screens/budget_form_screen.dart';

class BudgetManagementSubPage extends StatefulWidget {
  const BudgetManagementSubPage({super.key});

  @override
  State<BudgetManagementSubPage> createState() => BudgetManagementSubPageState();
}

class BudgetManagementSubPageState extends State<BudgetManagementSubPage> {

  void onOpenAddForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BudgetFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
    // TODO: implement build

    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 6,
              children: [
                Expanded(
                  child: BaseTextInput(
                    placeholder: 'Search budget',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onOpenAddForm();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded button
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16), // Button padding
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: ReorderableListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    key: Key('${index}'),
                    padding: EdgeInsets.all(16),
                    child: BudgetProgress(transferLimit: 6700, amountSpent: 2400),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final String item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                },
              ),
            ),
          ],
        )

    );
  }
}

