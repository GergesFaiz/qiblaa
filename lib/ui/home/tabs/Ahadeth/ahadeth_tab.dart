import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/HadethItem.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          height: height * 0.68),
      items: List.generate(50, (index) => index + 1).map((index) {
        return Hadethitem(index: index);
      }).toList(),
    );
  }
}
