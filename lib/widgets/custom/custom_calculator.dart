import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CustomCalculator extends StatelessWidget {

  const CustomCalculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.surface;
    TextStyle displayStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
      fontWeight: FontWeight.bold
    );
    TextStyle expressionStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
    );
    TextStyle buttonStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
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