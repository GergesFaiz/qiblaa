import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qiblaa/ui/home/tabs/Quran/MostRecentlyProvider.dart';
import 'package:qiblaa/ui/home/tabs/Quran/MostRecentlyWidget.dart';
import 'package:qiblaa/ui/home/tabs/Quran/Shared_prefs_utils.dart';
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
  late MostRecentlyProvider mostRecentlyProvider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentlyProvider.getMostRecentlyList();
    },);
  }

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
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
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
          Visibility(
            visible: mostRecentlyProvider.mostRecentlyList.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Text(
                    "Most Recently ",
                    style: AppTextStyle.bold16White,
                  ),
                ),
                SizedBox(
                  height: height * 0.17,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Detailsscreen.routeName,
                            arguments: mostRecentlyProvider
                                .mostRecentlyList[index],
                          );
                        },
                        child: Mostrecentlywidget(index: index),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: mostRecentlyProvider.mostRecentlyList.length,
                  ),
                ),
              ],
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
                    saveSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                      Detailsscreen.routeName,
                      arguments: filterList[index],
                    );

                    // readMostRecently();
                  },
                  child: SuraItemWidget(index: filterList[index]),
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
