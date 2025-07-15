import 'package:flutter/material.dart';

class DraweTile extends StatelessWidget {
  final void Function()? onTap_;
  double paddingsleft;
  double paddingsVertical;
  double? fontsizer;
  IconData? icon_;
  Color? iconColor;
  Color? textColor;
  String text_;


   DraweTile ({super.key,
   required this.paddingsleft,
   required this.paddingsVertical,
   required this.fontsizer,
   required this.icon_,
   required this.iconColor,
   required this.textColor,
   required this.onTap_,
   required this.text_,

   });

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(left: paddingsleft,bottom: paddingsVertical),
    child: ListTile(
      onTap: onTap_,
    leading: Icon(icon_, color: iconColor,),
    title: Text(text_,
    style: TextStyle(color: textColor, fontSize:fontsizer ),),
),
);
  }
}

