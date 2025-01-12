import 'package:flutter/material.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between limit and amount
          children: [
            Text(
              'Household Budget',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '${transferLimit.toStringAsFixed(2)} PHP',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: progressValue,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          minHeight: 2, // Adjust thickness as needed
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              '₱${(transferLimit - amountSpent).toStringAsFixed(2)} left of ₱${(transferLimit).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              ),
            ),
          ],
        )
      ],
    );
  }
}