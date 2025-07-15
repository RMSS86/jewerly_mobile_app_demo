import 'package:flutter/material.dart';
import './Theme.dart';
import 'ThemeSelected.dart';

//INVOKING THE SAVED DATA FROM THE THEMESELECTED PROVIDER
THEMESelection ThemeSelected = THEMESelection();

class ThemeProvider with ChangeNotifier
{

    //creates a themeData object from the lightMode on Theme Model saved on hive database
    ThemeData _themeData = THEMESelection.savedTheme;

    //creates getter that links the value form the dark light modes to a local provider variable
    ThemeData get themeData => _themeData;

    //wonders if the darkmode is on comparing directly from Them values
    bool get isDarkMode => _themeData == darkMode;

    set themeData(ThemeData themeData) 
    {
        _themeData = themeData;
        notifyListeners();

    }

    void toggleTheme() 
    {
        _themeData == lightMode ? themeData = darkMode : themeData = lightMode;

    }

    void ThemeDataLoader() 
    {
        ThemeSelected.loadData();

    }

    isdarkModeOn() 
    {
        ThemeData selectorDarkMode = darkMode;
        ThemeData selectorLightMode = lightMode;
        if (ThemeSelected.isDarkMode == true) 
        {
            return selectorDarkMode;
        }
        else 
        {
            return selectorLightMode;
        }
    }
}

