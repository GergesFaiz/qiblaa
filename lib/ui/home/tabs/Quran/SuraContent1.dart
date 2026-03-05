import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Suracontent1 extends StatefulWidget {


  String Verses;
  Suracontent1({super.key,required this.Verses});

  @override
  State<Suracontent1> createState() => _Suracontent1State();
}

class _Suracontent1State extends State<Suracontent1> {



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  widget.Verses.isEmpty
        ? Center(child: CircularProgressIndicator(color: AppColors.Gold,))
        : Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: width*0.04
      ),
      child: SingleChildScrollView(
        child: Text(textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          widget.Verses, style: AppTextStyle.bold20Gold,),
      ),
    );
  }
}
