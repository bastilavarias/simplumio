import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAccountMenu extends StatelessWidget {

  const ProfileAccountMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Accounts', style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
              )),
              SizedBox(height: 10),
              ListTile(
                tileColor: Theme.of(context).colorScheme.onSecondary,
                title: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                leading: Icon(
                  Icons.person_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ListTile(
                tileColor: Theme.of(context).colorScheme.onSecondary,
                title: Text(
                  'Activity Log',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                leading: Icon(
                  Icons.history_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ]
        )
    );
  }
}