import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentAccountCard extends StatelessWidget {
  final String amount;
  final String label;

  const InvestmentAccountCard({
    super.key,
    required this.amount,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.transparent,
        color: Theme.of(context).colorScheme.onSecondary,
        child: SizedBox(
            height: 100,
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    '4,342.71 PHP',
                    style: GoogleFonts.poppins(
                        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}