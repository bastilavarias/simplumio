import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestmentOwnAssetItem extends StatelessWidget {
  final String logoPath;
  final String symbol;
  final String name;
  final String coins;
  final String price;
  final String change;

  const InvestmentOwnAssetItem({
    super.key,
    required this.logoPath,
    required this.symbol,
    required this.name,
    required this.coins,
    required this.price,
    required this.change
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundImage: AssetImage(logoPath),
      ),
      title: Text(
        symbol,
        style: GoogleFonts.poppins(
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary
        ),
      ),
      subtitle: Text.rich(
        TextSpan(
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: Theme.of(context).textTheme.labelMedium?.fontSize
          ),
          text: 'Bitcoin ',
          children: [
            TextSpan(
              text: '(-0.45%)',
              style: TextStyle(color: Colors.green[600]),
            ),
          ],
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coins,
                  style: GoogleFonts.poppins(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                const SizedBox(height: 4.0),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize
                    ),
                    text: '₱100,405 ',
                    children: [
                      TextSpan(
                        text: '+₱898.87',
                        style: TextStyle(color: Colors.green[600]),
                      )
                    ],
                  ),
                )
              ]
          )
        ],
      ),
    );
  }
}