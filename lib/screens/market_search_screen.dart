import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/widgets/asset_card.dart';
import 'package:simplumio/widgets/base/base_sub_page_app_bar.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';

class MarketSearchScreen extends StatefulWidget {
  const MarketSearchScreen({super.key});

  @override
  State<MarketSearchScreen> createState() => MarketSearchScreenState();
}

class MarketSearchScreenState extends State<MarketSearchScreen>  with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: BaseSubPageAppBar(title: 'Search Market'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            BaseTextInput(
              placeholder: 'Search symbol/name',
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),

            TabBar(
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
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                color: Theme.of(context).colorScheme.secondary,
              ),
              tabs: const [
                Tab(text: 'Favorites'),
                Tab(text: 'Crypto'),
                Tab(text: 'Stocks'),
                Tab(text: 'ETFs'),
              ],
            ),

            Expanded(
              child: ReorderableListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return AssetCard(
                      logoPath: 'assets/images/investments/assets/bitcoin.png',
                      symbol: 'BTC',
                      name: 'Bitcoin',
                      price: '108,504',
                      change: '+2.4%',
                      key: Key('${index}')
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
        ),
      )
    );
  }
}