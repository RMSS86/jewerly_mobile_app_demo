import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AROptions extends StatefulWidget {
  @override
  State<AROptions> createState() => _AROptions();
}

class _AROptions extends State<AROptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 90,
      decoration: new BoxDecoration(
          border: new Border.all(width: 0.0, color: Colors.transparent),
          //color is transparent so that it does not blend with the actual color specified
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: const  Color.fromRGBO(33, 33, 33,
              0.36) // Specifies the background color and the opacity
      ),
      child: Container(
        height: 75.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add_a_photo, size: 45, color: Colors.white60),
            SizedBox(width: 50),
            Icon(Icons.diamond , size: 45, color: Colors.white),
            SizedBox(width: 50),
            Icon(Icons.flip_camera_ios_outlined, size: 45, color: Colors.white),
            //Icon(Icons.home, size: 36, color: Colors.white),
            //Icon(Icons.home, size: 36, color: Colors.white),
          ],
        ),
      ),
      //final arm block
    );
  }
}
