import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadeth.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadethArgs.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetailsScreen";

  HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var args = ModalRoute.of(context)!.settings.arguments as Hadethargs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Hadith ${args.numEinglishHadeth}',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLeftCorner),
                Text(
                  args.hadeth?.hadethTitle??'',
                  // SuraResource.arabicSuraList[index],
                  style: AppTextStyle.bold24Gold,
                ),
                Image.asset(AppAssets.imgRightCorner),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: width*0.04
              ),
              child: Text(textAlign: TextAlign.center,
                args.hadeth?.hadethBody??'',
                // SuraResource.arabicSuraList[index],
                style: AppTextStyle.bold20Gold,
              ),
            ),
          ),

          Image.asset(AppAssets.imgBottomDecoration),
        ],
      ),
    );
  }
}
