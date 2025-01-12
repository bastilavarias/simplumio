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
              'Office Budget',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              ),
            ),
            Text(
              '${transferLimit.toStringAsFixed(2)} PHP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
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
                  size: 18, // Set the size of the icon
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}