import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyKeys {
  static const String mostRecently = 'most_recently';
}

void saveSuraIndex(int newSuraIndex) async {
  //todo: Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //todo: get list from Shared_preferences.
  List<String> mostRecentlyList =
      prefs.getStringList(MostRecentlyKeys.mostRecently) ?? [];
  //todo: duplicate.
  if (mostRecentlyList.contains('$newSuraIndex')) {
    mostRecentlyList.remove('$newSuraIndex');
    mostRecentlyList.insert(0, ('$newSuraIndex'));
  } else {
    // todo: save index in list.
    mostRecentlyList.insert(0, ('$newSuraIndex'));
  }

  // todo: Limit.
  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }

  //todo: save list in Shared_preferences.
  await prefs.setStringList(MostRecentlyKeys.mostRecently, mostRecentlyList);
}
