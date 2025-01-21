import 'package:flutter/material.dart';
import 'package:simplumio/widgets/account_card.dart';
import 'package:simplumio/widgets/base/base_carousel.dart';
import 'package:simplumio/widgets/budget_progress.dart';
import 'package:simplumio/widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text('Account overview', style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                )),
                subtitle: Text('13,528.00 PHP', style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                    fontWeight: FontWeight.bold
                )),
              ),


              Padding(padding: EdgeInsets.only(
                left: 16,   // 16 pixels on the left
                right: 16,
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Accounts & Budgets', style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                        )),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Align content to the end of the Row
                            children: [
                              Text('Manage', style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                              )),
                              SizedBox(width: 1),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: Theme.of(context).textTheme.labelSmall?.fontSize,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    BaseCarousel(
                      items: [
                        AccountCard(
                          amount: '100',
                          label: 'Cash',
                        )
                      ],
                    ),

                    SizedBox(height: 16),
                    Column(
                      spacing: 16,
                     children: [
                       BudgetProgress(transferLimit: 7000, amountSpent: 3000),
                       BudgetProgress(transferLimit: 5600, amountSpent: 1350),
                     ],
                    ),
                  ],

                ),
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
                        Text('Recent Transactions', style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                        )),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Align content to the end of the Row
                            children: [
                              Text('View All', style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                              )),
                              SizedBox(width: 1),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: Theme.of(context).textTheme.labelSmall?.fontSize,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true, // Important: Set shrinkWrap to true
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return TransactionItem(); // Your list item widget
                    },
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
