import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetCard extends StatelessWidget {
  final String logoPath;
  final String symbol;
  final String name;
  final String price;
  final String change;

  const AssetCard({
    super.key,
    required this.logoPath,
    required this.symbol,
    required this.name,
    required this.price,
    required this.change
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Logo Circle
              CircleAvatar(
                backgroundImage: AssetImage(logoPath),
                radius: 14,
              ),
              const SizedBox(width: 12),
              // Stock Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    symbol,
                    style: GoogleFonts.poppins(
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Price and Percentage
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                change,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.green[600],
                    fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}