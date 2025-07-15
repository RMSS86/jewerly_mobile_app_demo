import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:jadecandyv1/Pages/LandingPage.dart';
import '../Services/AR/AREnv.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import '../components/AR/AROptionTile.dart';
import '../components/AR/_AR_options.dart';
import '../Screens/QRScreen.dart';
import 'package:flutter/foundation.dart';
import '../components/GeneralDrawer.dart';
import '../models/ARAsset/ARData/ARAssets.dart';


class ARPage extends StatefulWidget
{
    const ARPage({Key? key}) : super(key: key);

    @override
    State<ARPage> createState() => _ARPageState();
}

class _ARPageState extends State<ARPage>
{

    /////VARIABLES FOR ACCESSING AR NODE
    bool isAROn = true;
    ArCoreController? arCoreController;
    ArCoreFaceController? arCoreFaceController;
    ByteData? textureBytes;
    late int ARAssetIndex;

    //Provider.of<AREnv>(context).
    String assetUrl = ARAssets[0].url;
    String assetName_ = ARAssets[0].localName;

    @override
    Widget build(BuildContext context)
    {

        return Scaffold(
            extendBodyBehindAppBar: true,//ANDROID ONLY
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Builder(
                    builder: (context)
                    {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                                icon: Icon(Icons.menu),
                                color: Theme.of(context).colorScheme.inversePrimary,
                                onPressed: ()
                                {
                                    Scaffold.of(context).openDrawer();
                                }
                            )
                        );
                    }
                )
            ),
            body: Stack(
                children: <Widget>[

                    isAROn ? ArCoreView(
                            type: ArCoreViewType.STANDARDVIEW,
                            onArCoreViewCreated: _onArCoreViewCreated
                        ) : ArCoreFaceView(
                            onArCoreViewCreated: _onArCoreFaceViewCreated,
                            enableAugmentedFaces: true
                        ),

                    Container(
                        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
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
                                            onTap_: () async
                                            {

                                                isAROn == true ? isAROn = false : isAROn = true;
                                                print('ressed!!!!  {$isAROn}');
                                                setState(()
                                                    {
                                                    }
                                                );
                                            },
                                            icon_: Icons.flip_camera_ios_outlined,
                                            iconSize_: 39,
                                            iconColor_: Colors.white60,
                                            dividerWidth_: 24
                                        ),

                                        AROptionTile(
                                            onTap_: ()
                                            {
                                                Navigator.pop(context);
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => QREntryPage()));
                                                dispose();
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
                                            dividerWidth_: 0
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
                    // assetUrl = ARAssets[2].url;
                    // assetName_ =ARAssets[2].localName;
                    arCoreController!.removeNode(nodeName: 'entity');
                    _addImage(arCoreController!,
                        ARAssets[1].localName,
                        ARAssets[1].url);
                    // Provider.of<ARProvider>(context, listen: false).toggleARModel(ARAssets[2]);

                    setState(()
                        {

                        }
                    );

                    print(assetName_);
                },

                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: const Icon(Icons.multitrack_audio_sharp)

            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

            drawer: Drawer_()
        );
    }

    void _onArCoreFaceViewCreated(ArCoreFaceController controller)
    {
        arCoreFaceController = controller;
        loadMesh();
    }
    loadMesh() async
    {
        try
        {
            final ByteData textureBytes = await rootBundle.load('assets/Models/SBJ_AR_Model_A.png');
            arCoreFaceController?.loadMesh(
                textureBytes: textureBytes.buffer.asUint8List(),
                skin3DModelFilename: 'assets/Models/SBJ_AR_Model_A.png');
        }
        on PlatformException
        {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
        }
        catch(e,s)
        {
            print(e);
            print(s);
        }

    }

    void _onArCoreViewCreated(ArCoreController controller)
    {
        try
        {
            arCoreController = controller;
            _addImage(arCoreController!,
                Provider.of<ARProvider>(context, listen: false).globalARAsset_.localName,
                Provider.of<ARProvider>(context, listen: false).globalARAsset_.url);
        }
        on PlatformException catch (e,s)
        {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
            //dispose();

            print('////////////////////////////////////Exception details:\n //////////$e');
            print('Stack trace:\n $s');

        }
        catch (e,s)
        {
            print('////////////////////////////////////Exception details:\n //////////$e');
            print('Stack trace:\n $s');

        }
    }

    Future<Uint8List> getImageBytes(String url_, String imageName) async
    {
        final ByteData data = await rootBundle.load('$url_$imageName');
        print(imageName);
        return data.buffer.asUint8List();
    }

    void _addImage(ArCoreController controller, String name_, String urlPath) async
    {
        final imageBytes = await getImageBytes(urlPath, name_);

        final node = ArCoreNode(
            name: "entity",
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
        arCoreController?.dispose();
        super.dispose();

    }

}
