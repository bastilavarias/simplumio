import 'package:flutter/material.dart';

class BaseNavigationBar extends StatefulWidget {
  const BaseNavigationBar({super.key, required this.title, required this.selectedIndex, required this.onSelectedIndex});

  final String title;
  final int selectedIndex;
  final Function onSelectedIndex;

  @override
  State<BaseNavigationBar> createState() => BaseNavigationBarState();
}

class BaseNavigationBarState extends State<BaseNavigationBar> {

  @override
  Widget build(BuildContext context) {
    final List<NavigationDestination> items = [
      NavigationDestination(
        label: 'Home',
        tooltip: 'Dashboard',
        icon: Icon(Icons.dashboard_outlined, color: Theme.of(context).colorScheme.secondary),
        selectedIcon: Icon(Icons.dashboard, color: Theme.of(context).colorScheme.onPrimary),
      ),
      NavigationDestination(
        label: 'Planning',
        tooltip: 'Plan your finances',
        icon: Icon(Icons.account_balance_wallet_outlined, color: Theme.of(context).colorScheme.secondary),
        selectedIcon: Icon(Icons.account_balance_wallet, color: Theme.of(context).colorScheme.onPrimary),
      ),
      NavigationDestination(
        label: 'Insights',
        tooltip: 'Activity Insights',
        icon: Icon(Icons.data_exploration_outlined, color: Theme.of(context).colorScheme.secondary),
        selectedIcon: Icon(Icons.data_exploration, color: Theme.of(context).colorScheme.onPrimary),
      ),
      NavigationDestination(
        label: 'Profile',
        tooltip: 'Edit Account',
        icon: Icon(Icons.person_2_outlined, color: Theme.of(context).colorScheme.secondary),
        selectedIcon: Icon(Icons.person_2, color: Theme.of(context).colorScheme.onPrimary),
      )
    ];

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias, // Add this line
      color: Theme.of(context).colorScheme.primary,
      child: SizedBox(
        child: NavigationBar( // Use NavigationBar here
          selectedIndex: widget.selectedIndex,
          indicatorColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onDestinationSelected: (int index) {
            setState(() {
              widget.onSelectedIndex(index);
            });
          },
          destinations: items,
        ),
      ),
    );
  }
}