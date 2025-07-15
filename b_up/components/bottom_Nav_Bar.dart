import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

    BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
        child:
         GNav(
            color: Colors.grey[400],
           activeColor: Colors.grey.shade800,
           tabActiveBorder: Border.all(color: Colors.white),
           tabBackgroundColor: Colors.grey.shade100,
           mainAxisAlignment: MainAxisAlignment.center,
           tabBorderRadius: 15,
           gap: 9,
           onTabChange: (value) => onTabChange!(value),
           tabs:
          [
          GButton(
              icon: Icons.home,
              text: 'Shop',),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',),
           GButton(
             icon: Icons.image,
             text: 'Gallery',),
          GButton(
            icon: Icons.view_in_ar_sharp,
            text: 'AR',),
        ]
         )
    );
  }
}

