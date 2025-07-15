import 'package:flutter/material.dart';


class Drawer_ extends StatelessWidget {
  const Drawer_({super.key});

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
             child: Image.asset('assets/ecommerce/SBJ_logo_Stand_One.png',),
         ),


         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 50.0),
           child: Divider(color: Colors.grey[900],),
         ),

         //////////OTHER PAGES
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: ListTile(
             leading: Icon(Icons.home, color: Colors.white,),
             title: Text('Home',
               style: TextStyle(color: Colors.white, fontSize: 14),),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: ListTile(
             leading: Icon(Icons.multitrack_audio_sharp, color: Colors.white,),
             title: Text('Artists',
               style: TextStyle(color: Colors.white, fontSize: 14),),
           ),
         ),

         Padding(
           padding: const EdgeInsets.all(25.0),
           child: ListTile(
             leading: Icon(Icons.info, color: Colors.white,),
             title: Text('About',
               style: TextStyle(color: Colors.white, fontSize: 14),),
           ),
         ),
       ],
     ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListTile(
              leading: Icon(Icons.logout , color: Colors.white,),
              title: Text('LogOut',
                style: TextStyle(color: Colors.white, fontSize: 14),),
            ),
          ),



          ///////ABOUT SECTIONS


          /////FOOTTER


        ],
      ),
    );
  }
}
