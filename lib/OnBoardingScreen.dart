import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:qiblaa/ui/home/HomeScreen.dart';
import 'package:qiblaa/utils/AppAssets.dart';
import 'package:qiblaa/utils/AppColors.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // 1. Define a `GlobalKey` as part of the parent widget's state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(291, 171),
          child: Image.asset(AppAssets.BarImage),
        ),
        backgroundColor: AppColors.black,
        body: IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          pages: [
            itemBuildPageViewModel(
              title: "",
              body: "Welcome To Islmi App",
              image: AppAssets.onBoardingImageIntro,
            ),
            itemBuildPageViewModel(
              title: "Welcome To Islami ",
              body: "We Are Very Excited To Have You In Our Community",
              image: AppAssets.onBoardingImageKabba,
            ),
            itemBuildPageViewModel(
              title: "Reading the Quran",
              body: "Read, and your Lord is the Most Generous",
              image: AppAssets.onBoardingImageWelcome,
            ),
            itemBuildPageViewModel(
              title: "Bearish",
              body: "Praise the name of your Lord, the Most High",
              image: AppAssets.onBoardingImageBearish,
            ),
            itemBuildPageViewModel(
              title: "Holy Quran Radio",
              body:
                  "You can listen to the Holy Quran Radio through the application for free and easily",
              image: AppAssets.onBoardingImageRadio,
            ),
          ],
          onDone: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
          onSkip: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
          showSkipButton: true,
          showBackButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(
              color: AppColors.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          back: Text(
            "Back",
            style: TextStyle(
              color: AppColors.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          next: Text(
            "Next",
            style: TextStyle(
              color: AppColors.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          done: Text(
            "Finish",
            style: TextStyle(
              color: AppColors.Gold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            activeColor: AppColors.Gold,
            color: AppColors.grey,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

PageViewModel itemBuildPageViewModel({
  required String title,
  required String body,
  required String image,
}) {
  return PageViewModel(
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
        color: AppColors.Gold,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      imageFlex: 3,
      bodyAlignment: Alignment.bottomCenter,
      imageAlignment: Alignment.bottomCenter,
    ),

    title: title,
    bodyWidget: Text(
      textAlign: TextAlign.center,
      body,
      style: TextStyle(
        color: AppColors.Gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    image: Image.asset(image, fit: BoxFit.fill),
  );
}
