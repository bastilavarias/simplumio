import 'package:flutter/material.dart';

class BaseSubPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseSubPageAppBar({super.key, required this.title, this.backgroundColor, this.color});
  final String title;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0, // Remove shadow
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.primary,
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: Theme.of(context).textTheme.titleMedium?.fontSize,
            color: color ?? Theme.of(context).colorScheme.secondary,
        ), // Custom back icon
        onPressed: () {
          Navigator.pop(context); // Pops the current screen from the stack
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}