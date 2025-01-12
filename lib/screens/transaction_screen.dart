import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => TransactionScreenState();
}

class TransactionScreenState extends State<TransactionScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        title: Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: Theme.of(context).textTheme.titleMedium?.fontSize
          ), // Custom back icon
          onPressed: () {
            Navigator.pop(context); // Pops the current screen from the stack
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 30,
          children: [

          ],
        ),
      ),
    );
  }
}