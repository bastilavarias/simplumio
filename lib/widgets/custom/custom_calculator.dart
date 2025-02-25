import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCalculator extends StatelessWidget {

  const CustomCalculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.surface;
    TextStyle displayStyle = GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
      fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
      fontWeight: FontWeight.bold
    );
    TextStyle expressionStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
    );
    TextStyle buttonStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        decorationStyle: TextDecorationStyle.wavy
    );

    return SimpleCalculator(
      value: 0,
      hideExpression: false,
      hideSurroundingBorder: false,
      autofocus: true,
      onChanged: (key, value, expression) {
      },
      theme: CalculatorThemeData(
        borderColor: Colors.transparent,
        borderWidth: 0,
        displayColor: Colors.transparent,
        expressionColor: Colors.transparent,
        expressionStyle: expressionStyle,
        displayStyle:  displayStyle,
        operatorColor: buttonColor,
        operatorStyle: buttonStyle,
        commandColor: buttonColor,
        commandStyle: buttonStyle,
        numColor: buttonColor,
        numStyle: buttonStyle,
      ),
    );
  }
}