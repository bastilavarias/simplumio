import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {

  const TransactionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Transaction #1',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      ),
      subtitle: Text(
        'Jul 15',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
          fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '-₱450.40',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red, // Use the provided color for the amount
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}