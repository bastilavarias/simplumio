import 'package:flutter/material.dart';
import 'package:simplumio/screens/market_search_screen.dart';
import 'package:simplumio/widgets/asset_item.dart';
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

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
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
              ),

              ListTile(
                dense: true,
                title: Text('Portfolio overview', style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                )),
                subtitle: Text('13,528.00 PHP', style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.bold
                )),
              ),

              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your assets', style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                        )),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true, // Important: Set shrinkWrap to true
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return AssetItem(
                          logoPath: 'assets/images/investments/assets/bitcoin.png',
                          symbol: 'BTC',
                          name: 'Bitcoin',
                          price: '108,504',
                          change: '+2.4%',
                          key: Key('${index}')
                      );
                    },
                  ),
                ],
              ),
            ],
          )

      ),
    );
  }
}

