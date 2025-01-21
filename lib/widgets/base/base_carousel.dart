import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BaseCarousel extends StatelessWidget {
  final List<Widget> items;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final double height;

  const BaseCarousel({
    super.key,
    required this.items,
    this.autoPlay = false,
    this.enlargeCenterPage = true,
    this.height = 100.0
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: autoPlay,
        enlargeCenterPage: enlargeCenterPage,
      ),
      items: items.map((item) {
        return item;
      }).toList(),
    );
  }
}