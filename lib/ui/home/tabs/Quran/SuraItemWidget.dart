import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class SuraItemWidget extends StatefulWidget {
  int index;

  SuraItemWidget({required this.index});

  @override
  State<SuraItemWidget> createState() => _SuraItemWidgetState();
}

class _SuraItemWidgetState extends State<SuraItemWidget> {
  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      spacing: 24,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.ayaLogo),
            Text("${index + 1}", style: AppTextStyle.bold16White),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              SuraResource.englishSuraList[index],
              style: AppTextStyle.bold20White,
            ),
            Text(
              "${SuraResource.suraNumberList[index]} Verses  ",
              style: AppTextStyle.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          SuraResource.arabicSuraList[index],
          style: AppTextStyle.bold20White,
        ),
      ],
    );
  }
}
