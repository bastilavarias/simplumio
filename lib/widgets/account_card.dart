import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String amount;
  final String label;

  const AccountCard({
    super.key,
    required this.amount,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,

                  ),
                ),
                Text(
                  '47',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                  ),
                ),
              ],
            ),
            Expanded(child: Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              ),
            ))
            ,
          ],
        ),
      );
  }
}