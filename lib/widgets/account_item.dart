import 'package:flutter/material.dart';
import 'package:simplumio/screens/planning_account_form_screen.dart';
import 'package:simplumio/screens/transaction_screen.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {

    void onOpenMoreActions() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          builder: (BuildContext context) {
            return AccountItemMoreActions();
          });
    }

    return ListTile(
      title: Text('Cash'),
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
        onOpenMoreActions();
      },
    );
  }
}

class AccountItemMoreActions extends StatelessWidget {
  const AccountItemMoreActions({super.key});

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