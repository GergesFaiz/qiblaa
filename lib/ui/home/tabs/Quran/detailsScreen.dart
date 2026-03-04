import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Detailsscreen extends StatelessWidget {
  static const String routeName = "Detailsscreen";

  const Detailsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    return Scaffold(
      appBar: AppBar(title: Text(SuraResource.englishSuraList[index])),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLeftCorner),
                Text(
                  SuraResource.arabicSuraList[index],
                  style: AppTextStyle.bold20Gold,
                ),
                Image.asset(AppAssets.imgRightCorner),
              ],
            ),
          ),
          Text("Sura's Content", style: AppTextStyle.bold20Gold,),
          Spacer(),
          Image.asset(AppAssets.imgBottomDecoration),
        ],
      ),
    );
  }
}
