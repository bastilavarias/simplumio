import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/screens/planning_account_form_screen.dart';
import 'package:simplumio/screens/transaction_screen.dart';

class BudgetProgress extends StatelessWidget {
  final double transferLimit;
  final double amountSpent;

  const BudgetProgress({
    super.key,
    required this.transferLimit,
    required this.amountSpent,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = amountSpent / transferLimit;

    void onOpenMoreActions() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          builder: (BuildContext context) {
            return BudgetProgressMoreActions();
          });
    }

    return GestureDetector(
      onTap: () {
        onOpenMoreActions();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between limit and amount
            children: [
              Text(
                'Office Budget',
                style: GoogleFonts.poppins(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                '${transferLimit.toStringAsFixed(2)} PHP',
                style: GoogleFonts.poppins(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(50),
            value: progressValue,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            minHeight: 12, // Adjust thickness as needed
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(transferLimit - amountSpent).toStringAsFixed(2)} left of ${(transferLimit).toStringAsFixed(2)}',
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Underspending",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(width: 4), // Add some spacing between the text and icon
                  Icon(
                    Icons.trending_down, // Use the 'trending_down' icon
                    color: Theme.of(context).colorScheme.secondary, // Set color for the icon
                    size: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class BudgetProgressMoreActions extends StatelessWidget {
  const BudgetProgressMoreActions({super.key});


  @override
  Widget build(BuildContext context) {
    void onOpenEditFormScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlanningAccountFormScreen()),
      );
    }

    void onOpenTransactionScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionScreen()),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Expanded(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Manage Account', style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                    fontWeight: FontWeight.bold
                )),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('Edit account'),
                        onTap: () => {
                          onOpenEditFormScreen()
                        },
                      ),
                      ListTile(
                        title: Text('View transactions'),
                        onTap: () => {
                          onOpenTransactionScreen()
                        },
                      ),
                      ListTile(
                        title: Text('Invite collaborators'),
                      ),
                      ListTile(
                        title: Text(
                          'Delete account',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ))
    );
  }
}