import 'package:bhavishya_puran_departure/Provider/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class theme_provider extends ChangeNotifier{
  theme_model app_theme;

  theme_provider({required this.app_theme});

  void change_app_theme(bool val) async{
    app_theme.isDark =!app_theme.isDark;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("theme_completed", app_theme.isDark);
    notifyListeners();
  }
}