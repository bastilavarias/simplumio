import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/widgets/sub_page/account_management_sub_page.dart';
import 'package:simplumio/widgets/sub_page/budget_management_sub_page.dart';
import 'package:simplumio/widgets/sub_page/investment_management_sub_page.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => PlanningScreenState();
}

class PlanningScreenState extends State<PlanningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            overlayColor: WidgetStateProperty.all(Colors.transparent),
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
              Tab(text: 'Investments'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AccountManagementSubPage(),
                BudgetManagementSubPage(),
                InvestmentManagementSubPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

