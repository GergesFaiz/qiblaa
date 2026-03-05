import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/ahadeth_tab.dart';
import 'package:qiblaa/ui/home/tabs/More/more_tab.dart';
import 'package:qiblaa/ui/home/tabs/Quran/quran_tab.dart';
import 'package:qiblaa/ui/home/tabs/Radio/radio_tab.dart';
import 'package:qiblaa/ui/home/tabs/Sebha/sebha_tab.dart';

import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> tabList = [
  QuranTab(),
  AhadethTab(),
  SebhaTab(),
  RadioTab(),
  MoreTab(),
];

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> BackgroundList = [
    AppAssets.quran_bg,
    AppAssets.hadith_bg,
    AppAssets.sebha_bg,
    AppAssets.radio_bg,
    AppAssets.more_bg,
  ];

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Image.asset(
          BackgroundList[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size(289, 140),
              child: Image.asset(AppAssets.BarImage),
            ),
            body: tabList[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.white,
              unselectedItemColor: AppColors.black,
              backgroundColor: AppColors.Gold,
              type: BottomNavigationBarType.fixed,
              items: [
                buildBottomNavigationBarItem(
                  icon: AppAssets.quranIcon,
                  label: "Quran",
                  index: 0,
                ),
                buildBottomNavigationBarItem(
                  icon: AppAssets.hadethIcon,
                  label: "Hadeth",
                  index: 1,
                ),
                buildBottomNavigationBarItem(
                  icon: AppAssets.sebhaIcon,
                  label: "Sebha",
                  index: 2,
                ),
                buildBottomNavigationBarItem(
                  icon: AppAssets.radioIcon,
                  label: "Radio",
                  index: 3,
                ),
                buildBottomNavigationBarItem(
                  icon: AppAssets.timeIcon,
                  label: "Time",
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedBottomIcon(icon, index),
      label: label,
    );
  }

  Widget selectedBottomIcon(String icon, int index) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.Ligthblack,
            ),
            child: ImageIcon(AssetImage(icon)),
          )
        : ImageIcon(AssetImage(icon));
  }
}
