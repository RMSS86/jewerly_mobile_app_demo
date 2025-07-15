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
      padding: EdgeInsets.symmetric(vertical: 3),
        child:
         GNav(
           color:  Theme.of(context).colorScheme.inverseSurface,
           activeColor: Theme.of(context).colorScheme.surfaceDim,
           tabActiveBorder: Border.all(color: Theme.of(context).colorScheme.inverseSurface),
           tabBackgroundColor: Theme.of(context).colorScheme.secondary,
           mainAxisAlignment: MainAxisAlignment.center,
           tabBorderRadius: 15,
           gap: 3,
           onTabChange: (value) => onTabChange!(value),
           tabs:
          const [
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
            icon: Icons.amp_stories_outlined,
            text: 'Artistic',),
        ]
         )
    );
  }
}

// GButton(
// icon: Icons.view_in_ar_sharp,
// text: 'AR',),

