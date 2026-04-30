import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiblaa/ui/home/tabs/Quran/MostRecentlyProvider.dart';
import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Mostrecentlywidget extends StatefulWidget {
  int index;

  Mostrecentlywidget({super.key, required this.index});

  @override
  State<Mostrecentlywidget> createState() => _MostrecentlywidgetState();
}

class _MostrecentlywidgetState extends State<Mostrecentlywidget> {
  late MostRecentlyProvider mostRecentlyProvider;

  @override
  Widget build(BuildContext context) {
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);

    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.Gold,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  SuraResource
                      .englishSuraList[mostRecentlyProvider
                      .mostRecentlyList[widget.index]],
                  style: AppTextStyle.bold24Black,
                ),
                Text(
                  SuraResource
                      .arabicSuraList[mostRecentlyProvider
                      .mostRecentlyList[widget.index]],
                  style: AppTextStyle.bold24Black,
                ),
                Text(
                  "${SuraResource.suraNumberList[mostRecentlyProvider
                      .mostRecentlyList[widget.index]]} Verses  ",
                  style: AppTextStyle.bold14Black,
                ),
              ],
            ),
            Image.asset(
              AppAssets.imgMostRecent,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
