import 'package:flutter/material.dart';
import 'package:qiblaa/OnBoardingScreen.dart';
import 'package:qiblaa/ui/home/tabs/Ahadeth/hadethDetailsScreen.dart';
import 'package:qiblaa/ui/home/tabs/Quran/detailsScreen.dart';
import 'package:qiblaa/utils/AppTheme.dart';

import 'ui/home/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,

      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        Detailsscreen.routeName: (context) => Detailsscreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),

      },
    );
  }
}
