import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Quran/SuraItemWidget.dart';
import 'package:qiblaa/ui/home/tabs/Quran/detailsScreen.dart';
import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (text) {
              search(text);
            },
            style: AppTextStyle.bold16White,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.Gold),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.Gold),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.vectorIC),
                color: AppColors.Gold,
              ),
              hint: Text("Sura Name", style: AppTextStyle.bold16White),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text("Most Recently ", style: AppTextStyle.bold16White),
          ),
          SizedBox(
            height: height * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.Gold,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              SuraResource.englishSuraList[index],
                              style: AppTextStyle.bold24Black,
                            ),
                            Text(
                              SuraResource.arabicSuraList[index],
                              style: AppTextStyle.bold24Black,
                            ),
                            Text(
                              "${SuraResource.suraNumberList[index]} Verses  ",
                              style: AppTextStyle.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.imgMostRecent, fit: BoxFit.fill),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text("Sura's List", style: AppTextStyle.bold16White),
          ),
          Expanded(
            child: filterList.isEmpty
                ? Center(
              child: Text(
                "No Sura Item Found",
                style: AppTextStyle.bold24Gold,
              ),
            )
                : ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Detailsscreen.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItemWidget(index: filterList[index],),
                );
              },
              separatorBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      color: AppColors.white,
                      thickness: 1,
                      endIndent: width * 0.1,
                      indent: width * 0.1,
                    ),
                  ),
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void search(String text) {
    List<int> searchResulte = [];
    for (int i = 0; i < SuraResource.arabicSuraList.length; i++) {
      if (SuraResource.arabicSuraList[i].toLowerCase().contains(text) ||
          SuraResource.englishSuraList[i].toLowerCase().contains(text)) {
        searchResulte.add(i);
      }
    }
    filterList = searchResulte;
    setState(() {});
  }
}
