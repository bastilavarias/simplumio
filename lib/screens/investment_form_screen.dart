import 'package:flutter/material.dart';
import 'package:simplumio/screens/market_search_screen.dart';
import 'package:simplumio/widgets/base/base_dropdown.dart';
import 'package:simplumio/widgets/base/base_sub_page_app_bar.dart';
import 'package:simplumio/widgets/base/base_text_divider.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';
import 'package:simplumio/widgets/custom/custom_calculator.dart';

class InvestmentFormScreen extends StatefulWidget {
  const InvestmentFormScreen({super.key});

  @override
  State<InvestmentFormScreen> createState() => InvestmentFormScreenState();
}

class InvestmentFormScreenState extends State<InvestmentFormScreen> {

  void onOpenMarketSearchScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MarketSearchScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    List<String> periods = ['One week', '15 Days', 'Monthly', 'Custom'];

    return Scaffold(
      appBar: BaseSubPageAppBar(title: 'Add new Investment'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              GestureDetector(
                onTap: () {
                  onOpenMarketSearchScreen();
                },
                child: AbsorbPointer(
                  child: BaseDropdown(
                  label: 'Asset',
                  placeholder: 'Select asset',
                  items: periods,
                  ),
                ),
              ),
              BaseTextInput(
                label: 'Value',
                placeholder: '0.00',
                icon: false,
              ),
              BaseTextDivider(
                  dividerColor: Theme.of(context).colorScheme.onSecondary,
                  textColor: Theme.of(context).colorScheme.secondary,
                  text: 'or',
              ),
              Column(
                spacing: 10,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.currency_bitcoin), // Binance icon
                      label: Text('Connect Binance'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondary,
                        elevation: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle button press
                      },
                      icon: Icon(Icons.file_copy_outlined),
                      label: Text('Import from file'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.onSecondary,
                          elevation: 0
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width, // Full width
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                'Save Investment',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}