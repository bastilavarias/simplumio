import 'package:flutter/material.dart';
import 'package:simplumio/widgets/base/base_sub_page_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplumio/widgets/base/base_textarea_input.dart';
import 'package:simplumio/widgets/custom/custom_calculator.dart';
import 'package:simplumio/utils/money_formatter.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';


class TransactionFormScreen extends StatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  State<TransactionFormScreen> createState() => TransactionFormScreenState();
}

class TransactionFormScreenState extends State<TransactionFormScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0; // To store the current selected tab index


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      setState(() {
        tabIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onOpenCalculator() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          builder: (BuildContext context) {
            return SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Enter Amount (PHP)', style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                          fontWeight: FontWeight.bold
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: CustomCalculator(),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50), // Custom border radius
                          ),
                        ),
                        child: Text('Set Amount',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      )
                    ],
                  ),
                )
            );
          });
    }

    return Scaffold(
      appBar: BaseSubPageAppBar(
        title: 'Add new Transaction',
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        color: Theme
            .of(context)
            .colorScheme
            .onPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            isScrollable: false,
            controller: tabController,
            indicator: BoxDecoration(
              border: null,
              color: Colors.transparent,
            ),
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            labelStyle: GoogleFonts.poppins(
                fontSize: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.fontSize,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                fontWeight: FontWeight.bold
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.fontSize,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary,
                fontWeight: FontWeight.bold
            ),
            tabs: [
              theTab('Income', 0, Icon(Icons.keyboard_double_arrow_up_rounded, color: Colors.green[600], size: Theme.of(context).textTheme.displaySmall?.fontSize)),
              theTab('Expense', 1, Icon(Icons.keyboard_double_arrow_down_rounded, color: Colors.red[600], size: Theme.of(context).textTheme.displaySmall?.fontSize)),
              theTab('Transfer', 2, Icon(Icons.keyboard_double_arrow_right_rounded, color: tabIndex == 2 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary, size: Theme.of(context).textTheme.displaySmall?.fontSize)),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  onOpenCalculator();
                },
                child: AbsorbPointer(
                  child: theAmountDisplayInput(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                spacing: 30,
                children: [
                  theTransactionsDetailsPicker(),
                  BaseTextInput(
                    label: 'Title',
                    placeholder: 'Maybe, your food lunch?',
                    icon: false,
                  ),
                  BaseTextAreaInput(
                    label: 'Notes',
                    placeholder: 'Type here...',
                    icon: false,
                  ),
                ]
            ),
          )

        ],
      ),

      floatingActionButton: theSaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget theSaveButton() {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width, // Full width
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .primary,
            label: Text(
              'Save Expense',
              style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget theTab(String text, int index, Icon icon) {
    return Tab(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: tabIndex == index
            ? Theme.of(context).colorScheme.onPrimary
            : Theme
            .of(context)
            .colorScheme
            .primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,  // Centers both text and icon vertically
                      crossAxisAlignment: CrossAxisAlignment.center,  // Ensures both are aligned on the same line
                      children: [
                        SizedBox(width: 8),
                        Text(text, style: TextStyle(fontSize: Theme.of(context).textTheme.titleLarge?.fontSize)),  // Your text widget here
                        icon,  // Your icon widget here
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

  Widget theAmountDisplayInput() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                formatMoney(500),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
                )
              ),
            ]
        ),
      ),
    );
}

  Widget theTransactionsDetailsPicker() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
              padding:  EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Transaction details',
                      style: GoogleFonts.poppins(
                        fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                        color: Theme.of(context).colorScheme.primary, // Set the label text color to gray
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            )
      ),
    );
  }

  Widget theTimePicker() {
    return ListTile(
      title: Text(
        "Today",
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "10:03 PM",
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  Widget theAccountPicker() {
    return ListTile(
      title: Text(
        "UnionBank",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatMoney(17506),
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}

class DateTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.calendar_today),
            SizedBox(width: 8),
            Text('Today'),
          ],
        ),
        Row(
          children: const [
            Text('10:03 PM'),
            SizedBox(width: 8),
            Icon(Icons.access_time),
          ],
        ),
      ],
    );
  }
}

class TransactionTypeChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        TransactionChip(label: 'Default'),
        TransactionChip(label: 'Upcoming'),
        TransactionChip(label: 'Subscription'),
      ],
    );
  }
}

class TransactionChip extends StatelessWidget {
  final String label;

  const TransactionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }
}

class AccountChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AccountChip(label: 'Union Bank (PHP)'),
        AccountChip(label: 'test (USD)'),
        AccountChip(label: '+'),
      ],
    );
  }
}

class AccountChip extends StatelessWidget {
  final String label;

  const AccountChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

class AttachmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.attachment),
            SizedBox(width: 8),
            Text('Add attachment'),
          ],
        ),
        const Icon(Icons.add),
      ],
    );
  }
}