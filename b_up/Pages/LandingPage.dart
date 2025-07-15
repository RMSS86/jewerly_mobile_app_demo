
import 'package:flutter/material.dart';
import '../components/Drawer_A.dart';
import '../components/bottom_Nav_Bar.dart';
import 'CartPage.dart';
import 'GalleryPage.dart';
import 'ShoppingPage.dart';
import '_ARPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
      print(_selectedIndex);
    });
  }

  final List<Widget> _pages = [
    const ShoppingPage(),

    const CartPage(),

    const GalleryPage(),



  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,//ANDROID ONLY
      extendBody: false, //ANDROID ONLY
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index)=>navigateBottomBar(index),),
      backgroundColor: Colors.grey[300],
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.menu),
              color: Colors.black54,
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              ),
            );
          }
        ),
      ),
      drawer: Drawer_(),
    );
  }
}
