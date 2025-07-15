import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import './Theme.dart';

class THEMESelection with ChangeNotifier{

  bool isDarkMode = false;
  final _themeSelection = Hive.box('_themeSelected_');

  static late ThemeData savedTheme;

  void createInitialData(){
    isDarkMode = false;

  }

   Future<void> loadData() async{
    isDarkMode =  await _themeSelection.get('THEME');
     isDarkMode == true ? savedTheme = darkMode :savedTheme = lightMode;

  }

  void upgradeData(){
    _themeSelection.put('THEME', isDarkMode);

  }

}
