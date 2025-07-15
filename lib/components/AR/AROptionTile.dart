import 'package:flutter/material.dart';

class AROptionTile extends StatelessWidget {
  void Function()? onTap_;
  final IconData icon_;
  final double iconSize_;
  final Color iconColor_;
  final double dividerWidth_;

   AROptionTile({super.key,
          required this.icon_,
          required this.iconSize_,
          required this.iconColor_,
          required this.dividerWidth_,
                   this.onTap_,
   });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap_,
          child: Icon(icon_,
              size: iconSize_,
              color: iconColor_ ),
        ),
        SizedBox(width: dividerWidth_ ),
      ],

    );
  }
}
