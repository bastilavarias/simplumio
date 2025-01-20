import 'package:flutter/material.dart';
import 'package:simplumio/screens/market_search_screen.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';

class PlanningInvestmentManagementSubPage extends StatefulWidget {
  const PlanningInvestmentManagementSubPage({super.key});

  @override
  State<PlanningInvestmentManagementSubPage> createState() => PlanningInvestmentManagementSubPageState();
}

class PlanningInvestmentManagementSubPageState extends State<PlanningInvestmentManagementSubPage> {
  void onOpenAddForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MarketSearchScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(15, (index) => 'Item ${index + 1}');
    // TODO: implement build

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
          children: [
            GestureDetector(
              onTap: () {
                onOpenAddForm();
              },
              child: AbsorbPointer(
                child: BaseTextInput(
                  placeholder: 'Search market',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ),
            ),


          ],
        )

    );
  }
}

