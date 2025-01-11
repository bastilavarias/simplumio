import 'package:flutter/material.dart';
import 'package:simplumio/screens/planning_account_form_screen.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';

class PlanningBudgetManagementPane extends StatefulWidget {
  const PlanningBudgetManagementPane({super.key});

  @override
  State<PlanningBudgetManagementPane> createState() => PlanningBudgetManagementPaneState();
}

class PlanningBudgetManagementPaneState extends State<PlanningBudgetManagementPane> {

  void onOpenForm() {
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
                  onOpenForm();
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
          )
        ],
      ),

    );
//     return Column(
//       children: [
//         // ListTile(
//         //   trailing: SizedBox( // Wrap the Row in a SizedBox for better control
//         //     width: 120, // Adjust the width as needed
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.end, // Align items to the end
//         //       children: [
//         //         TextButton(
//         //           onPressed: onOpenForm,
//         //           child: Row(
//         //             mainAxisAlignment: MainAxisAlignment.end, // Align content to the end of the Row
//         //             children: [
//         //               Icon(
//         //                 Icons.add,
//         //                 size: Theme.of(context).textTheme.labelLarge?.fontSize,
//         //                 color: Theme.of(context).colorScheme.primary,
//         //               ),
//         //               SizedBox(width: 1),
//         //               Text('Add', style: TextStyle(
//         //                 color: Theme.of(context).colorScheme.primary,
//         //                 fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
//         //               )),
//         //             ],
//         //           ),
//         //         )
//         //       ],
//         //     ),
//         //   ),
//         // ),
//
// /*
//         Expanded(
//           child: ReorderableListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 key: Key('$index'), // Important: Provide a unique key
//                 title: Text(
//                   'Cash',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: Theme.of(context).textTheme.labelLarge?.fontSize
//                   ),
//                 ),
//                 subtitle: Text(
//                   '0 Transactions',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.secondary,
//                       fontSize: Theme.of(context).textTheme.labelLarge?.fontSize
//                   ),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "447.84 PHP",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.primary,
//                           fontSize: Theme.of(context).textTheme.labelLarge?.fontSize
//                       ),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   // Action to perform when the ListTile is tapped
//                 },
//               );
//             },
//             onReorder: (int oldIndex, int newIndex) {
//               setState(() {
//                 if (oldIndex < newIndex) {
//                   newIndex -= 1;
//                 }
//                 final String item = items.removeAt(oldIndex);
//                 items.insert(newIndex, item);
//               });
//             },
//           ),
//         ),
//
// */
//       ],
//     );
//
  }

}

