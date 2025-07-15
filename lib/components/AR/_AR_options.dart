import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AROptions extends StatelessWidget {
  List<Widget> childrenOptions_;

  AROptions({super.key,
    required this.childrenOptions_,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      height: 60,
      decoration: new BoxDecoration(
          border: new Border.all(width: 0.0, color: Colors.transparent),
          //color is transparent so that it does not blend with the actual color specified
          borderRadius: const BorderRadius.all(
              Radius.circular(18.0)
          ),
          color: const  Color.fromRGBO(33, 33, 33,
              0.36) // Specifies the background color and the opacity
      ),
      child: Container(
        height: 76.0,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: childrenOptions_,
        ),
      ),
      //final arm block
    );
  }
}
