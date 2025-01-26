import 'package:flutter/material.dart';
import 'package:simplumio/widgets/insight_main_graph.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              children: [
                Text('This page would be like scrolling/story based insight of your spending'),
                SizedBox(height: 40),
              ]
          )
        )
    );
  }
}
