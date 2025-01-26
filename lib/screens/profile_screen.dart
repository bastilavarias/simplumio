import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/widgets/profile_account_menu.dart';
import 'package:simplumio/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/human.png'), // Replace with your asset image
                  ),
                  Text(
                    'Walter White',
                    style: GoogleFonts.poppins(
                        fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    'walter.white@breaking.bad',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 0
                    ),
                    child: Text('Edit profile'),
                  ),
                ],
              ),
            ),

            ProfileAccountMenu()
          ],
        ),
      ),
    );
  }

}