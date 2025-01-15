import 'package:flutter/material.dart';
import 'package:simplumio/screens/insight_screen.dart';
import 'package:simplumio/screens/profile_screen.dart';
import 'package:simplumio/screens/transaction_form_screen.dart';
import 'package:simplumio/widgets/base/base_app_bar.dart';
import 'package:simplumio/widgets/base/base_navigation_bar.dart';
import 'package:simplumio/screens/home_screen.dart';
import 'package:simplumio/screens/planning_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.title});
  final String title;

  @override
  State<MainLayout> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  @override


  Widget build(BuildContext context) {
    void onOpenTransactionFormScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionFormScreen()),
      );

    }
    return Scaffold(
      appBar: BaseAppBar(),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomeScreen(),
          PlanningScreen(),
          InsightScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BaseNavigationBar(title: 'test', selectedIndex: selectedIndex, onSelectedIndex: onSelectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onOpenTransactionFormScreen();
        },
        backgroundColor: Theme.of(context).colorScheme.primary, // Icon inside the FAB
        shape: CircleBorder(),
        child: Icon(Icons.note_add, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  onSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
