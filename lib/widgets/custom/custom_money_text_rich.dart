import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMoneyTextRich extends StatelessWidget {
  const CustomMoneyTextRich({super.key, this.prefix, this.color, required this.value, this.size, this.fontWeight});

  final String? prefix;
  final Color? color;
  final double? size;
  final String value;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: size,
            fontWeight: fontWeight,
        ),
        children: [
          TextSpan(
            text: '${prefix}',
            style: GoogleFonts.roboto(color: color),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
