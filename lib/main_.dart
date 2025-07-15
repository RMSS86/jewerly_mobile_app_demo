import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jadecandyv1/Theme/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'Screens/SplashScreen.dart';
import 'Services/AR/AREnv.dart';
import 'Theme/ThemeSelected.dart';
import 'models/Cart.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async
{

    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    var _themebox = await Hive.openBox('_themeSelected_');
    await THEMESelection().loadData();

    runApp(
        MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) => THEMESelection()),
                ChangeNotifierProvider(create: (context) => ThemeProvider()),
                ChangeNotifierProvider(create: (context) => ARProvider())

            ],
            child: JadeCandy())
    );
}

class JadeCandy extends StatefulWidget
{
    const JadeCandy({super.key});

    @override
    State<JadeCandy> createState() => _JadeCandyState();
}

class _JadeCandyState extends State<JadeCandy>
{
    @override
    Widget build(BuildContext context) 
    {
        return ChangeNotifierProvider(
            create: (context) => Cart(),
            builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Splashpage(),
                theme: Provider.of<ThemeProvider>(context).themeData

            )

        );
    }
}

