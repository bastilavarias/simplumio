import 'package:flutter/material.dart';

class BaseDropdown extends StatefulWidget {
  const BaseDropdown({
    super.key,
    required this.items,
    required this.placeholder,
    this.label,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  final List<String> items;
  final String placeholder;
  final String? label;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<BaseDropdown> createState() => _BaseDropdownState();
}

class _BaseDropdownState extends State<BaseDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    BorderRadius wholeBorder = BorderRadius.circular(20);
    BorderRadius topBorderOnly = const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );
    BorderRadius bottomBorderOnly = const BorderRadius.only(
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );

    return Column(
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: topBorderOnly,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.label!,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Dropdown
        DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: widget.label != null && widget.label!.isNotEmpty
                ? bottomBorderOnly
                : wholeBorder,
          ),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              filled: true,
              fillColor: Theme.of(context).colorScheme.onSecondary,
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.label != null && widget.label!.isNotEmpty
                    ? bottomBorderOnly
                    : wholeBorder,
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.label != null && widget.label!.isNotEmpty
                    ? bottomBorderOnly
                    : wholeBorder,
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            ),
            hint: Text(
              widget.placeholder,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold
              ),
            ),
            value: selectedValue,
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                  item,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
