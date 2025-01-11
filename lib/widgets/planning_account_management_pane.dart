import 'package:flutter/material.dart';
import 'package:simplumio/screens/planning_account_form_screen.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';

class PlanningAccountManagementPane extends StatefulWidget {
  const PlanningAccountManagementPane({super.key});

  @override
  State<PlanningAccountManagementPane> createState() => PlanningAccountManagementPaneState();
}

class PlanningAccountManagementPaneState extends State<PlanningAccountManagementPane> {

  void onOpenAddForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlanningAccountFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(5, (index) => 'Item ${index + 1}');
    // TODO: implement build

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: [
             Expanded(
               child: BaseTextInput(
                 placeholder: 'Search',
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
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return AccountPreviewTile(id: index, key: Key('${index}'));
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
      ),

    );
  }
}

class AccountPreviewTile extends StatelessWidget {
  const AccountPreviewTile({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Cash',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Transactions: 47',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "447.84 PHP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
            ),
          ),
        ],
      ),
      onTap: () {
        // Action to perform when the ListTile is tapped
      },
    );
  }
}