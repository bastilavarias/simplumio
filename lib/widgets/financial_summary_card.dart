import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialSummaryCard extends StatelessWidget {
  const FinancialSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text('Financial insights of your account', style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
      )),
      subtitle: Text('Good', style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
          fontWeight: FontWeight.w600
      )),
    );
  }
}
