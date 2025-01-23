import 'package:flutter/material.dart';
import 'package:simplumio/screens/investment_form_screen.dart';
import 'package:simplumio/screens/market_search_screen.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';
import 'package:simplumio/widgets/custom/custom_money_text_rich.dart';
import 'package:simplumio/widgets/sub_page/investment_own_asset_item.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentManagementSubPage extends StatefulWidget {
  const InvestmentManagementSubPage({super.key});

  @override
  State<InvestmentManagementSubPage> createState() => InvestmentManagementSubPageState();
}

class InvestmentManagementSubPageState extends State<InvestmentManagementSubPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onOpenSearchForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MarketSearchScreen()),
    );
  }

  void onOpenAddForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InvestmentFormScreen()),
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
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          onOpenSearchForm();
                        },
                        child: AbsorbPointer(
                          child: BaseTextInput(
                            placeholder: 'Search market',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
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
              ),

              ListTile(
                title: Text('Est. Total Value', style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('13,528.00 PHP', style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                        fontWeight: FontWeight.bold
                    )),
                    Row(
                      children: [
                        Text('Todays PNL ', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        CustomMoneyTextRich(
                            color: Colors.green[600],
                            prefix: '+₱',
                            value: '898.87'
                        ),
                        Text(' (0.45%)', style: TextStyle(color: Colors.green[600])),
                      ],
                    )
                  ],
                ),
              ),

              Divider(color: Theme.of(context).colorScheme.onSecondary),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  labelPadding: EdgeInsets.only(left: 0, right: 16),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    border: null,
                  ),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Crypto'),
                    Tab(text: 'Stocks'),
                    Tab(text: 'ETFs'),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true, // Important: Set shrinkWrap to true
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InvestmentOwnAssetItem(
                          logoPath: 'assets/images/investments/assets/bitcoin.png',
                          symbol: 'BTC',
                          name: 'Bitcoin',
                          coins: '1.56775',
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

