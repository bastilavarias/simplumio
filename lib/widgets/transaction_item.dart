import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
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
          Text(
            '-₱450.40',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.red, // Use the provided color for the amount
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}