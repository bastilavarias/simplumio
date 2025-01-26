import 'package:flutter/material.dart';
import 'package:material_charts/material_charts.dart';

class InsightMainGraph extends StatelessWidget {
  final double value;
  final double maxValue;
  final Color barColor;
  final Color backgroundColor;

  const InsightMainGraph({
    super.key,
    required this.value,
    required this.maxValue,
    required this.barColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialBarChart(
      width: 100,
      height: 20,
      data: [
        BarChartData(value: 30, label: 'Apples', color: Colors.red),
      ],
      style: BarChartStyle(
        gridColor: Colors.grey.shade300,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14),
        valueStyle: TextStyle(fontSize: 12),
        barSpacing: 0.3,
        cornerRadius: 6.0,
        gradientEffect: true,
        gradientColors: [Colors.purple, Colors.cyan],
      ),
      showGrid: true,
      showValues: true,
    );
  }
}