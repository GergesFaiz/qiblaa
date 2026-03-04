import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppAssets.dart';

class Reciterswidget extends StatelessWidget {
  Reciterswidget({super.key});

  List<String> imagesList = [
    AppAssets.radio4,
    AppAssets.radio5,
    AppAssets.radio6,
    AppAssets.radio7,
    AppAssets.radio,
    AppAssets.radio1,
    AppAssets.radio2,
    AppAssets.radio3,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Image.asset(imagesList[index], height: 141, width: 390);
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),

          itemCount: imagesList.length,
        ),
      ),
    );
  }
}
