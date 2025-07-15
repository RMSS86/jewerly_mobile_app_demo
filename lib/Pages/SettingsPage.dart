import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../Theme/ThemeProvider.dart';
import '../Theme/ThemeSelected.dart';


class SettingsPage extends StatefulWidget
{
    const SettingsPage({super.key});
    @override
    State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
{
    final _themeSelection = Hive.box('_themeSelected_'); 
    THEMESelection ThemeSelected = THEMESelection();

    @override
    void initState() 
    {
        // TODO: if this is the first time ever opoening the app, then create default data
        _themeSelection.get('THEME') == null ? ThemeSelected.createInitialData() : ThemeSelected.loadData();
        print('from the init statement: ${ThemeSelected.isDarkMode}');
        super.initState();
    }

    @override
    Widget build(BuildContext context) 
    {

        void changeTheme()
        {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            ThemeSelected.isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
            print(' from cupertino swtich provider ${Provider.of<ThemeProvider>(context, listen: false).isDarkMode}');
            ThemeSelected.upgradeData();
            print('from aftertheme seleted upgrade: ${ThemeSelected.isDarkMode}');
        }

        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Theme.of(context).colorScheme.inversePrimary
            ),

            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: AssetImage(
                            Provider.of<ThemeProvider>(context).isDarkMode == true ?
                                'assets/ecommerce/jadeCandy_polar_mosaic_white.png' :
                                'assets/ecommerce/jadeCandy_polar_mosaic.png'

                        ),
                        fit: BoxFit.fill
                    )
                ),
                child: Column(
                    children: [
                        Container(
                            decoration: BoxDecoration(

                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                            margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text('Dark Mode', style: TextStyle(color: Colors.white)),
                                    CupertinoSwitch(
                                        value: ThemeSelected.isDarkMode,
                                        onChanged: (value) => 
                                        {
                                            changeTheme()
                                        })
                                ]

                            )
                        ),
                        SizedBox(height: 150),
                        Center(
                            child: Image.asset('assets/ecommerce/OptimizedCubeLogo_plus_Letters_A.png', height: 270)
                        ),
                        Center(
                            child: Image.asset(
                                Provider.of<ThemeProvider>(context).isDarkMode == true ?
                                    'assets/ecommerce/SBJ_logoLetters_only_white.png' :
                                    'assets/ecommerce/SBJ_logoLetters_only_black.png', width: 120)
                        )

                    ]
                )
            )
        );
    }
}




