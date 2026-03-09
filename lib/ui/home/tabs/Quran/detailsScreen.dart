// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qiblaa/ui/home/tabs/Quran/SuraContent.dart';
// import 'package:qiblaa/ui/home/tabs/Quran/SuraContent1.dart';
// import 'package:qiblaa/ui/home/tabs/Quran/hadethDetailsScreen.dart';
// import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
// import 'package:qiblaa/utils/AppAssets.dart';
// import 'package:qiblaa/utils/AppColors.dart';
// import 'package:qiblaa/utils/AppTextStyle.dart';
//
// class Detailsscreen extends StatefulWidget {
//   static const String routeName = "Detailsscreen";
//
//   Detailsscreen({super.key});
//
//   @override
//   State<Detailsscreen> createState() => _DetailsscreenState();
// }
//
// class _DetailsscreenState extends State<Detailsscreen> {
//   List<String> Verses = [];
//   String Verses1 = '';
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     int index = ModalRoute.of(context)!.settings.arguments as int;
//     if (Verses.isEmpty) {
//       loadSuraFile(index);
//     }
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.add_circle, color: Colors.black, size: 35),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.search, color: Colors.black, size: 35),
//           ),
//         ],
//         title: Text(SuraResource.englishSuraList[index]),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.03),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(AppAssets.imgLeftCorner),
//                 Text(
//                   SuraResource.arabicSuraList[index],
//                   style: AppTextStyle.bold20Gold,
//                 ),
//                 Image.asset(AppAssets.imgRightCorner),
//               ],
//             ),
//           ),
//           Expanded(
//             child:
//             ListView.separated(
//               itemBuilder: (context, index) {
//                 return Suracontent(Suraindex: index, SuraVerses: Verses);
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 10);
//               },
//               itemCount: Verses.length,
//             ),
//           ),
//
//           Image.asset(AppAssets.imgBottomDecoration),
//         ],
//       ),
//     );
//   }
//
//   void loadSuraFile(int index) async {
//     String content = await rootBundle.loadString(
//       'assets/files/suras/${index + 1}.txt',
//     );
//     List<String> lines = content.split('\n');
//     Verses = lines;
//     Future.delayed(Duration(seconds: 2), () => setState(() {}));
//   }
//
//
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:qiblaa/ui/home/tabs/Quran/SuraContent.dart';
import 'package:qiblaa/ui/home/tabs/Quran/SuraContent1.dart';
import 'package:qiblaa/ui/home/tabs/Quran/sourses/SuraResource.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class Detailsscreen extends StatefulWidget {
  static const String routeName = "Detailsscreen";

  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  List<String> versesList = [];
  String versesText = '';
  bool showListView = true;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (versesList.isEmpty && versesText.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showListView = true;
              });
            },
            icon:Icon(FlutterIslamicIcons.quran,size: 40,)

          ),
          IconButton(
            onPressed: () {
              setState(() {
                showListView = false;
              });
            },
            icon: Icon(FlutterIslamicIcons.quran2,size: 40,)
          ),
        ],
        title: Text(SuraResource.englishSuraList[index],style: AppTextStyle.bold20Gold,),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLeftCorner),
                Text(SuraResource.arabicSuraList[index],
                    style: AppTextStyle.bold24Gold),
                Image.asset(AppAssets.imgRightCorner),
              ],
            ),
          ),

          Expanded(
            child: showListView
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return Suracontent(Suraindex: i, SuraVerses: versesList);
                },
                separatorBuilder: (context, i) => SizedBox(height: 10),
                itemCount: versesList.length,
              ),
            )
                : SingleChildScrollView(child: Suracontent1(Verses: versesText)),
          ),

          Image.asset(AppAssets.imgBottomDecoration),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String content =
    await rootBundle.loadString('assets/files/suras/${index + 1}.txt');

    versesList = content.split('\n');

    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    versesText = lines.join('');

    setState(() {});
  }
}