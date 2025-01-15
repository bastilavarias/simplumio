import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionFormScreen extends StatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  State<TransactionFormScreen> createState() => TransactionFormScreenState();
}

class TransactionFormScreenState extends State<TransactionFormScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        title: Text(
          'Add new Transaction',
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
          Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.only(left: 16, bottom: 0),
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                controller: _tabController,
                indicator: BoxDecoration(
                  border: null,
                ),
                labelStyle: GoogleFonts.poppins(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold
                ),
                unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold
                ),
                tabs: const [
                  Tab(text: 'Accounts'),
                  Tab(text: 'Budgets'),
                  Tab(text: 'Goals'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Text('Accounts'),
                    Text('Budgets'),
                    Text('Goals')
                  ],
                ),
              ),
            ],
          ),
        )
          ],
        ),
      ),
    );
  }
}