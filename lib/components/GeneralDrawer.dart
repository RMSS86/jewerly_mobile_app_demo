import 'package:flutter/material.dart';
import 'package:jadecandyv1/Pages/ArtistsPage.dart';
import 'package:jadecandyv1/Pages/LandingPage.dart';
import 'package:jadecandyv1/Screens/ForescastScreen.dart';
import 'package:jadecandyv1/Screens/InfoScreen.dart';
import 'package:jadecandyv1/Screens/SplashScreen.dart';
import '../Pages/SettingsPage.dart';
import '../Pages/_ARPage.dart';
import '../Pages/_ARPageUnified.dart';
import '../Screens/QRScreen.dart';
import 'DrawerTile.dart';
double _paddingsVertical = 5.0;
double _paddingsleft = 25.0;
double _fontsizer =15;
Color _textColor = Colors.grey.shade300;

class Drawer_ extends StatelessWidget {
   Drawer_({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(

      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /////////////LOGO SECTIONS
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 50.0),
               child: Divider(color: Colors.grey[900],),
             ),

             DrawerHeader(
                 child: Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png',),
             ),


             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 50.0),
               child: Divider(color: Colors.grey[900],),
             ),

             DraweTile(
              paddingsleft: _paddingsleft,
              paddingsVertical: _paddingsVertical,
              fontsizer: _fontsizer,
              icon_: Icons.home,
              iconColor:  Theme.of(context).colorScheme.secondary,
              textColor: _textColor,
               onTap_: (){

                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Splashpage()));

               },
               text_: 'Home',
             ),
             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.shopping_cart,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
               },
               text_: 'Shop',
             ),
             //////////OTHER PAGES
             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.view_in_ar_sharp,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ARPage()));
                 //Navigator.push(context, MaterialPageRoute(builder: (context)=>LocalAndWebObjectsWidget()));

               },
               text_: 'AR',
             ),

             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.qr_code_scanner_outlined,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>QREntryPage()));

               },
               text_: 'Scan',
             ),


             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.multitrack_audio_sharp,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistsPage()));

               },
               text_: 'Artists',
             ),
             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.bolt_outlined,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ForecastScreen()));


               },
               text_: 'Forecast',
             ),

             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.settings,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
               },
               text_: 'Settings',
             ),

             DraweTile(
               paddingsleft: _paddingsleft,
               paddingsVertical: _paddingsVertical,
               fontsizer: _fontsizer,
               icon_: Icons.info,
               iconColor:  Theme.of(context).colorScheme.secondary,
               textColor: _textColor,
               onTap_: (){
                 Navigator.pop(context);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen()));

               },
               text_: 'About',
             ),


           ],
         ),

          /////FOOTTER
          DraweTile(
          paddingsleft: _paddingsleft,
          paddingsVertical: _paddingsVertical,
          fontsizer: _fontsizer,
          icon_: Icons.logout,
          iconColor:  Theme.of(context).colorScheme.secondary,
          textColor: _textColor,
          onTap_: (){
            Navigator.pop(context);

          },
          text_: 'LogOut',
          ),

        ],
      ),
    );
  }
}
