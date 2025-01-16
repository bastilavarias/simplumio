import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTextAreaInput extends StatefulWidget {
  const BaseTextAreaInput({super.key, required this.placeholder, this.label, this.icon, this.prefixIcon, this.suffixIcon});

  final String placeholder;
  final String? label;
  final bool? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<BaseTextAreaInput> createState() => BaseTextAreaInputState();
}

class BaseTextAreaInputState extends State<BaseTextAreaInput> {
  @override
  Widget build(BuildContext context) {
    BorderRadius wholeBorder = BorderRadius.circular(20);
    BorderRadius topBorderOnly = BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );
    BorderRadius bottomBorderOnly = BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );

    return Column(
        children: [
          widget.label != null && widget.label!.isNotEmpty ?  DecoratedBox(
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.onSecondary,
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: topBorderOnly,
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.label ?? '',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                        color: Theme.of(context).colorScheme.primary, // Set the label text color to gray
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) : Container(),
          TextFormField(
            maxLines: 6,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: 16,
                top: 22,
                left: 16,
                right: 16,
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xFFFAFAFA),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.label != null && widget.label!.isNotEmpty ?  bottomBorderOnly : wholeBorder,
                borderSide: BorderSide(color: Colors.transparent),
              ),
             enabledBorder: OutlineInputBorder(
                borderRadius: widget.label != null && widget.label!.isNotEmpty ?  bottomBorderOnly : wholeBorder,
                borderSide: BorderSide(color: Colors.transparent),
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            ),
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      );
  }
}