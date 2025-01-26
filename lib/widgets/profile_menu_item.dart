import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuItem extends StatelessWidget {

  const ProfileMenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      tileColor: Theme.of(context).colorScheme.onSecondary,
      title: Text(
        'Menu Item',
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}