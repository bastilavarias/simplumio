import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/widgets/custom/custom_money_text_rich.dart';

class TransactionItem extends StatelessWidget {

  const TransactionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '2pc Chicken',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
        ),
      ),
      subtitle: Text(
        'Cash',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomMoneyTextRich(
              color: Colors.green[600],
              prefix: '+₱',
              value: '898.87',
              size: Theme.of(context).textTheme.labelLarge?.fontSize,
              fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}