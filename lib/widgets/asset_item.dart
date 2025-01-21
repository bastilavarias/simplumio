import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetItem extends StatelessWidget {
  final String logoPath;
  final String symbol;
  final String name;
  final String price;
  final String change;

  const AssetItem({
    super.key,
    required this.logoPath,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20,
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
        subtitle: Text(
            name,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.secondary
            )
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
                  price,
                  style: GoogleFonts.poppins(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  change,
                  style: GoogleFonts.poppins(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.green[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            )
          ],
        ),
      );
  }
}