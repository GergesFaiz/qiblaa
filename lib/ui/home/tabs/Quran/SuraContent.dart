import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Suracontent extends StatefulWidget {
  List<String> SuraVerses;
  int Suraindex;

  Suracontent({ required this.SuraVerses, required this.Suraindex});

  @override
  State<Suracontent> createState() => _SuracontentState();
}

class _SuracontentState extends State<Suracontent> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: InkWell(
          onTap: () {
            setState(() {
              if (selected == true) {
                selected = false;
              } else {
                selected = true;
              }

              selected == true ? AppColors.Gold : AppColors.black;
            });
          },

          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: selected == true ? AppColors.Gold : AppColors.black,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.Gold, width: 2),
            ),
            child: Center(
              child: Text(
                '${widget.SuraVerses[widget.Suraindex]}[${widget.Suraindex + 1}]',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: selected == true
                    ? AppTextStyle.bold20Black
                    : AppTextStyle.bold20Gold,
              ),
            ),
          ),
        ),
      );
    }
  }

