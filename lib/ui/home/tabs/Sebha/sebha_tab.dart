import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';


class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  List<String> sebhaList = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله"
  ];
  int sebhaNumber = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        spacing: 16,
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: AppTextStyle.bold36White,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 500, left: 10),
                  child: Image.asset("assets/images/1.1.png",width: width*0.36,height: height*0.10,)),
              AnimatedRotation(
                turns: turns,
                duration: Duration(milliseconds: 80),
                child: GestureDetector(

                    onTap: () {
                      setState(() {
                        turns += (1 / 30);
                        sebhaTextChange();
                      });
                    },
                    child: Image.asset("assets/images/1.2.png",width: width*0.95,height: height*0.43)),
              ),
              Column(spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(sebhaList[counter],
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bold36White),
                  Text(
                    "$sebhaNumber",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bold36White,
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }

  void sebhaTextChange() {
    sebhaNumber++;
    if (sebhaNumber == 32) {
      sebhaNumber = 0;
      if (counter == (sebhaList.length - 1)) {
        counter = 0;
      } else {
        counter++;
      }
    }
    setState(() {});
  }
}