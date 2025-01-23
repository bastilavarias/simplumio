import 'package:flutter/material.dart';

class BaseTextDivider extends StatelessWidget {

  const BaseTextDivider({super.key, required this.text, this.dividerColor, this.textColor});

  final String text;
  final Color? dividerColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Divider(
            color: dividerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}