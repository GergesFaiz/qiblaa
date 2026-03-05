import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadeth.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadethArgs.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadethDetailsScreen.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Hadethitem extends StatefulWidget {
  int index;

  Hadethitem({super.key, required this.index});

  @override
  State<Hadethitem> createState() => _HadethitemState();
}

class _HadethitemState extends State<Hadethitem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
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
    return InkWell(
      onLongPress: () {
        Navigator.of(context).pushNamed(
            HadethDetailsScreen.routeName,
            arguments:Hadethargs(
                numEinglishHadeth:widget.index ,
                hadeth: hadeth)
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.Gold,
          image: DecorationImage(
            image: AssetImage(AppAssets.hadithCardBackGround),
          ),
        ),
        child: hadeth == null
            ? Center(child: CircularProgressIndicator(color: AppColors.Gold))
            : Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.imgLeftCorner1),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      hadeth?.hadethTitle ?? '',
                      style: AppTextStyle.bold24Black,
                    ),
                  ),
                  Image.asset(AppAssets.imgRightCorner1),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: SingleChildScrollView(
                  child: Text(
                    hadeth?.hadethBody ?? '',
                    style: AppTextStyle.bold18Black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            Image.asset(AppAssets.imgBottomDecoration1),
          ],
        ),
      ),
    );
  }

  void loadHadethFile() async {
    String hadethContent = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );
    String hadethTitle = hadethContent.substring(
      0,
      hadethContent.indexOf('\n'),
    );
    String hadethBody = hadethContent.substring(
      hadethContent.indexOf('\n') + 1,
    );
    hadeth = Hadeth(hadethTitle: hadethTitle, hadethBody: hadethBody);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
