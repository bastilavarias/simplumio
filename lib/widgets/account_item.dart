import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.id});

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