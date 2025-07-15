import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
// import 'Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import '../UI/_AR_options.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;

class Ar_page extends StatefulWidget {

  const Ar_page({super.key});
  static String id= 'ar_page';

  @override
  State<Ar_page> createState() => _Ar_pageState();
}

class _Ar_pageState extends State<Ar_page> {

  late ArCoreController arCoreController;
  ByteData ? textureBytes;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

          children: <Widget>[
            ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated),
            Positioned(
              bottom: 0.9,
              child: AROptions(),
            )
          ]
      ),
      // AROptions(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          //dispose();
        },
        backgroundColor: const  Color.fromRGBO(255, 255, 255,
            0.36),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat ,
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addImage(arCoreController);
  }

  Future<Uint8List> getImageBytes(String imageName) async {
    final ByteData data = await rootBundle.load('assets/sbj_images/$imageName');
    print(imageName);
    return data.buffer.asUint8List();
  }

  void _addImage(ArCoreController controller) async {
    final imageBytes = await getImageBytes('SBJ_AR_Model_A.png');

    final node = ArCoreNode(
      image: ArCoreImage(
          bytes: imageBytes,
          width: 610,
          height: 1000
      ),
      position: vector64.Vector3(0, -3, -3), //x,y,z

    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
