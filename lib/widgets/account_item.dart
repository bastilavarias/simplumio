import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {

    void onOpenMoreActions() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          builder: (BuildContext context) {
            return AccountItemMoreActions();
          });
    }

    return ListTile(
      title: Text(
        'Cash',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Transactions: 47',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "447.84 PHP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
            ),
          ),
        ],
      ),
      onTap: () {
        onOpenMoreActions();
      },
    );
  }
}

class AccountItemMoreActions extends StatelessWidget {
  const AccountItemMoreActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.43,
        child: Expanded(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Manage Account', style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                    fontWeight: FontWeight.bold
                )),
                ListTile(
                  title: Text('Cash',
                  style: TextStyle(
                      fontWeight: FontWeight.bold)),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text(
                  "447.84 PHP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
                  ),
                ),
              ],
            ),
          ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('Edit account'),
                      ),
                      ListTile(
                        title: Text('View transactions'),
                      ),
                      ListTile(
                        title: Text('Invite collaborators'),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          'Delete account',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ))
    );
  }
}