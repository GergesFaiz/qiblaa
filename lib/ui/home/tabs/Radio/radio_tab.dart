import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/Radio/radioWidget.dart';
import 'package:qiblaa/ui/home/tabs/Radio/recitersWidget.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TabBar(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
            color: AppColors.Gold,
          ),
          dividerColor: Colors.transparent,
          labelStyle: AppTextStyle.bold16Black,
          unselectedLabelStyle: AppTextStyle.bold16White,
          tabs: [
            Tab(text: "Radio"),
            Tab(text: "Verses"),
          ],
        ),

        body: TabBarView(children: [RadioWidget(), Reciterswidget()]),
      ),
    );
  }
}
