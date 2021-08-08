import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData dark = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

ThemeData light = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  late bool _themed;
  late SharedPreferences prefs;

  ThemeNotifier() {
    _themed = true;
    _loadFromPrefs();
  }

  bool get themed => _themed;

  void toggleTheme() {
    _themed = !_themed;
    _setPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _themed = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _setPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, themed);
  }
}
