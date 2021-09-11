import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/styles.dart';
import 'package:flutter_news_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyNewsPreferences();
  }

  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyNewsActive = false;

  bool get isDailyNewsActive => _isDailyNewsActive;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyNewsPreferences() async {
    _isDailyNewsActive = await preferencesHelper.isDailyNewsActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(true);
    _getTheme();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getDailyNewsPreferences();
  }

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;
}
