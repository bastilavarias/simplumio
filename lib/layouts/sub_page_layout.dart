import 'package:flutter/material.dart';

class SubPageLayout extends StatefulWidget {
  const SubPageLayout({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  State<SubPageLayout> createState() => SubPageLayoutState();
}

class SubPageLayoutState extends State<SubPageLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        title: Text(
            widget.title,
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
      body: widget.body,
    );
  }

}
