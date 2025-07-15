import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class StoriesInfo extends StatefulWidget {
  final String title_;
  final String subTitle_;
  final String model_;

   StoriesInfo({
     super.key,
     required this.title_,
     required this.subTitle_,
     required this.model_,
});

  @override
  State<StoriesInfo> createState() => _StoriesInfo();
}

class _StoriesInfo extends State<StoriesInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 72,
      decoration: new BoxDecoration(
          border: new Border.all(width: 0.0, color: Colors.transparent),
          //color is transparent so that it does not blend with the actual color specified
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0),
          ),
          color: Theme.of(context).colorScheme.tertiary ,// Specifies the background color and the opacity
        boxShadow: [
        BoxShadow(
        color: Theme.of(context).colorScheme.inverseSurface,
        offset: Offset(1.0, 1.0), //(x,y)
        blurRadius: 12.0,
      ),
      ],
      ),

      child: Container(
        height: 75.0,
        child:  Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          Text(widget.title_,
              style: GoogleFonts.dmSerifText(fontSize: 15,
            color: Colors.white,)),
          Text(widget.subTitle_,
              style: GoogleFonts.dmSerifText(fontSize: 10,
                color: Colors.grey.shade500)),
          Text(widget.model_,
              style: GoogleFonts.dmSerifText(fontSize: 12,
                color: Colors.grey.shade300)),


          ],
        ),
      ),
      //final arm block
    );
  }
}

//ANOTHER OPTION!
// return Material(
// elevation: 20,
// child: Container(),
// );