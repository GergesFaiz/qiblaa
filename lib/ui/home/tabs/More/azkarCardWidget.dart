import 'package:flutter/material.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';
import 'package:qiblaa/utils/AppTextStyle.dart';

class AzkarcardWidget extends StatelessWidget {
  int index;

  AzkarcardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.Gold),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.black,
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(azkarImages[index], fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(azkarList[index], style: AppTextStyle.bold20White),
          ),
        ],
      ),
    );
  }

  List<String> azkarList = [
    "Evening Azkar",
    "Morning Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
    "Evening Azkar",
    "Morning Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
    "Evening Azkar",
    "Morning Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
    "Evening Azkar",
    "Morning Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
    "Evening Azkar",
    "Morning Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
  ];
  List<String> azkarImages = [
    AppAssets.imgAzkar1,
    AppAssets.imgAzkar14,
    AppAssets.imgAzkar12,
    AppAssets.imgAzkar4,
    AppAssets.imgAzkar0,
    AppAssets.imgAzkar1,
    AppAssets.imgAzkar2,
    AppAssets.imgAzkar3,
    AppAssets.imgAzkar4,
    AppAssets.imgAzkar5,
    AppAssets.imgAzkar6,
    AppAssets.imgAzkar7,
    AppAssets.imgAzkar8,
    AppAssets.imgAzkar9,
    AppAssets.imgAzkar10,
    AppAssets.imgAzkar11,
    AppAssets.imgAzkar12,
    AppAssets.imgAzkar13,
    AppAssets.imgAzkar14,
    AppAssets.imgAzkar15,
  ];
}
