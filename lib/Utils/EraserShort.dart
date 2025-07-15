// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [showModalBottomSheet].
//
// void main() => runApp(const ModalBottomSheetApp());
//
// class ModalBottomSheetApp extends StatelessWidget {
//   const ModalBottomSheetApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Modal Bottom Sheet Sample')),
//         body: const ModalBottomSheetExample(),
//       ),
//     );
//   }
// }
//
// enum AnimationStyles { defaultStyle, custom, none }
//
// const List<(AnimationStyles, String)> animationStyleSegments =
// <(AnimationStyles, String)>[
//   (AnimationStyles.defaultStyle, 'Default'),
//   (AnimationStyles.custom, 'Custom'),
//   (AnimationStyles.none, 'None'),
// ];
//
// class ModalBottomSheetExample extends StatefulWidget {
//   const ModalBottomSheetExample({super.key});
//
//   @override
//   State<ModalBottomSheetExample> createState() =>
//       _ModalBottomSheetExampleState();
// }
//
// class _ModalBottomSheetExampleState extends State<ModalBottomSheetExample> {
//   Set<AnimationStyles> _animationStyleSelection = <AnimationStyles>{
//     AnimationStyles.defaultStyle
//   };
//   AnimationStyle? _animationStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SegmentedButton<AnimationStyles>(
//             selected: _animationStyleSelection,
//             onSelectionChanged: (Set<AnimationStyles> styles) {
//               setState(() {
//                 _animationStyle = switch (styles.first) {
//                   AnimationStyles.defaultStyle => null,
//                   AnimationStyles.custom => AnimationStyle(
//                     duration: const Duration(seconds: 3),
//                     reverseDuration: const Duration(seconds: 1),
//                   ),
//                   AnimationStyles.none => AnimationStyle.noAnimation,
//                 };
//                 _animationStyleSelection = styles;
//               });
//             },
//             segments: animationStyleSegments
//                 .map<ButtonSegment<AnimationStyles>>(
//                     ((AnimationStyles, String) shirt) {
//                   return ButtonSegment<AnimationStyles>(
//                       value: shirt.$1, label: Text(shirt.$2));
//                 }).toList(),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             child: const Text('showModalBottomSheet'),
//             onPressed: () {
//               showModalBottomSheet<void>(
//                 context: context,
//                 sheetAnimationStyle: _animationStyle,
//                 builder: (BuildContext context) {
//                   return SizedBox.expand(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           const Text('Modal bottom sheet'),
//                           ElevatedButton(
//                             child: const Text('Close'),
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

///circular avatar!
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 4),
// child: CircleAvatar(
// radius: 16,
// backgroundColor: Colors.black12,
// backgroundImage: AssetImage(review!.urlImage),
// ),
// )



/////////////AR
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import '../components/AR/AROptionTile.dart';
import '../components/AR/_AR_options.dart';
import '../Screens/QRScreen.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//TODO:importQR Module!

class ARPage extends StatefulWidget
{

    const ARPage({super.key});

    @override
    State<ARPage> createState() => _ARPageState();
}

class _ARPageState extends State<ARPage>
{

    final bool isAROn = true;

    /////VARIABLES FOR ACCESSING AR NODES
    late ArCoreController arCoreController;
    ByteData? textureBytes;
    String assetName_ = 'OptimizedCubeLogo_A.png';

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            body: Stack(
                children: <Widget>[

                    ArCoreView(
                        onArCoreViewCreated: _onArCoreViewCreated),

                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                AROptions(
                                    childrenOptions_: <Widget>[
                                        //CREATE TILE BOTTON FOR FUNCTIONS, CHECK ON BMI PROJECT
                                        AROptionTile(
                                            onTap_: ()
                                            {
                                            },
                                            icon_: Icons.add_a_photo,
                                            iconSize_: 39,
                                            iconColor_: Colors.white60,
                                            dividerWidth_: 24
                                        ),

                                        AROptionTile(
                                            onTap_: ()
                                            {
                                            },
                                            icon_: Icons.flip_camera_ios_outlined,
                                            iconSize_: 39,
                                            iconColor_: Colors.white60,
                                            dividerWidth_: 24
                                        ),

                                        AROptionTile(
                                            onTap_: ()
                                            {
                                            },
                                            icon_: Icons.qr_code_2_sharp,
                                            iconSize_: 39,
                                            iconColor_: Colors.white60,
                                            dividerWidth_: 24
                                        ),

                                        AROptionTile(
                                            onTap_: ()
                                            {
                                            },
                                            icon_: Icons.diamond,
                                            iconSize_: 39,
                                            iconColor_: Colors.yellow,
                                            dividerWidth_: 24
                                        )
                                    ]
                                )
                            ]
                        ))
                ]
            ),
            // AROptions(),

            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    setState(()
                        {
                            //assetName_
                            //_onArCoreViewCreated
                        }
                    );

                    print(assetName_);
                },
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: const Icon(Icons.multitrack_audio_sharp)
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat 
        );
    }

    void _onArCoreViewCreated(ArCoreController controller) 
    {
        try
        {
            arCoreController = controller;
            _addImage(arCoreController, assetName_);
        }
        on PlatformException
        {

            Navigator.push(context, MaterialPageRoute(builder: (context) => ARPage()));
            dispose();
        }
        catch (e,s)
        {
            print('////////////////////////////////////Exception details:\n //////////$e');
            print('Stack trace:\n $s');
        }
    }

    Future<Uint8List> getImageBytes(String imageName) async
    {
        final ByteData data = await rootBundle.load('assets/ecommerce/$imageName');
        print(imageName);
        return data.buffer.asUint8List();
    }

    void _addImage(ArCoreController controller, String aN_) async
    {
        final imageBytes = await getImageBytes(aN_);
        //SBJ_logo_Stand_One.png SBJ_AR_Model_A.png

        final node = ArCoreNode(
            image: ArCoreImage(
                bytes: imageBytes,
                width: 610,
                height: 1000
            ),
            position: vector64.Vector3(0, -3, -3) //x,y,z

        );
        controller.addArCoreNode(node);
    }

    @override
    void dispose() 
    {
        super.dispose();
        arCoreController.dispose();

    }

}
