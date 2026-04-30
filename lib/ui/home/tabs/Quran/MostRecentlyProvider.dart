import 'package:flutter/cupertino.dart';
import 'package:qiblaa/ui/home/tabs/Quran/Shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyProvider extends ChangeNotifier {
  //todo:Data
  List<int> mostRecentlyList = [];

  //todo:FunctionData
  void getMostRecentlyList() async {
    //todo: Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> mostRecentlyListString =
        prefs.getStringList(MostRecentlyKeys.mostRecently) ?? [];
    mostRecentlyList = mostRecentlyListString.map((e) => int.parse(e)).toList();
    notifyListeners();
  }
}
