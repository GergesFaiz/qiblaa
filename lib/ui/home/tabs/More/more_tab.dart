import 'package:flutter/material.dart';
import 'package:qiblaa/ui/home/tabs/More/azkarCardWidget.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

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
          Image.asset(
            AppAssets.imgTime, fit: BoxFit.fill,
            height: height * 0.32,
            width: width * 0.90,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.025),
            child: Text("Azkar", style: AppTextStyle.bold16White),
          ),
          Expanded(
              child: GridView.builder(itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Azkarcardwidget(index: index,);
                },)


          ),

        ],
      ),
    );
  }
}


