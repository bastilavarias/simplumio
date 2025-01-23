import 'package:flutter/material.dart';
import 'package:simplumio/widgets/base/base_dropdown.dart';
import 'package:simplumio/widgets/base/base_sub_page_app_bar.dart';
import 'package:simplumio/widgets/base/base_text_input.dart';
import 'package:simplumio/widgets/custom/custom_calculator.dart';

class BudgetFormScreen extends StatefulWidget {
  const BudgetFormScreen({super.key});

  @override
  State<BudgetFormScreen> createState() => BudgetFormScreenState();
}

class BudgetFormScreenState extends State<BudgetFormScreen> {

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
    List<String> periods = ['One week', '15 Days', 'Monthly', 'Custom'];

    return Scaffold(
      appBar: BaseSubPageAppBar(title: 'Add new Budget'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            children: [
              BaseTextInput(
                label: 'Name',
                placeholder: 'Office Budget',
                icon: false,
              ),
              GestureDetector(
                onTap: () {
                  onOpenCalculator();
                },
                child: AbsorbPointer(
                  child: BaseTextInput(
                    label: 'Initial value',
                    placeholder: '0.00',
                    icon: false,
                  ),
                ),
              ),
              BaseDropdown(
                label: 'Period',
                placeholder: 'Select period',
                items: periods,
              ),
              BaseDropdown(
                label: 'From',
                placeholder: 'Select Date',
                items: [],
              ),
              BaseDropdown(
                label: 'To',
                placeholder: 'Select Date',
                items: [],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width, // Full width
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                'Save Budget',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}