import 'package:flutter/material.dart';
import 'package:simplumio/widgets/base/base_sub_page_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onOpenCalculator();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
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
                  BaseTextInput(
                    label: 'Date',
                    placeholder: 'January 14, 2024',
                    icon: false,
                  ),
                  BaseTextInput(
                    label: 'Category',
                    placeholder: 'Food',
                    icon: false,
                  ),
                  // BaseTextAreaInput(
                  //   label: 'Notes',
                  //   placeholder: 'Type here...',
                  //   icon: false,
                  // ),
                  theTransactionsDetails(),
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
      height: MediaQuery.of(context).size.height * 0.15,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                formatMoney(0, false),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                )
              ),
            ]
        ),
      ),
    );
}

  Widget theTransactionsDetails() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction details',
                    style: GoogleFonts.poppins(
                        fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                        color: Theme.of(context).colorScheme.primary, // Set the label text color to gray
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  theTransactionDetails()
                ],
              )
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
            formatMoney(17506, false),
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

  Widget theTransactionDetails() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date & time'),
              Row(
                children: [
                  Text(
                    "Today 6:00AM",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.secondary,
                    size: Theme.of(context).textTheme.bodySmall?.fontSize,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Notes'),
              Row(
                children: [
                  Text(
                    "Add note",
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.secondary,
                    size: Theme.of(context).textTheme.bodySmall?.fontSize,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Type'),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.red[600],
                    size: 12,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "Expense",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Theme.of(context).textTheme.labelMedium?.fontSize
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recurring',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Transform.scale(
                    scale: .8,
                    child: Switch(
                      value: true,
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (bool value) {
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              Text(
                "This transaction will be added again the following months at the same day as today.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          )

          // const Text(
          //   "Please make sure your name in the payment account matches your OKX account name. You can contact me if you encounter any issues before raising a dispute. When you pay, avoid putting crypto-related words (BTC, ETH, USDT, OKX, Crypto, etc.) in the reference.",
          //   style: TextStyle(
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      );
  }
}