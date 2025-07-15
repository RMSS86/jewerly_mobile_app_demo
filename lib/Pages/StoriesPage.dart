import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:jadecandyv1/models/Stories/StoriesData/stories.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import '../Services/AR/AREnv.dart';
import '../UI/Stories/StoriesInfo.dart';
import '../models/ARAsset/ARAssetModel.dart';
import '../models/ARAsset/ARData/ARAssets.dart';



class StoriesPage extends StatefulWidget {
 const StoriesPage({super.key});


  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  late final Timer timer;
  final List<String> artShotImagesUrls_ =[];
  final List<String> artShotImagesTitles_ =[];
  final List<String> artShotImageSubTitles_ =[];
  final List<String> artShotImagesModels_ =[];
  late final String url_;
  late final String localName_;

  int _index = 0;


  @override
  void initState() {
    super.initState();
    unpackingStoriesData();
    // url_= ARAssets[3].url;
    // localName_= ARAssets[3].localName;

    url_ = Provider.of<ARProvider>(context, listen: false).globalARAsset3D_.url;
    localName_ = Provider.of<ARProvider>(context, listen: false).globalARAsset3D_.localName;

    timer = Timer.periodic(Duration(seconds: 7), (timer) {
      setState(() => _index++);
    }
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void unpackingStoriesData(){
  for(var url = 0; url < stories.length; url++){
    artShotImagesUrls_.add(stories[url].urlImage);
    artShotImagesTitles_.add(stories[url].title);
    artShotImageSubTitles_.add(stories[url].subtitle);
    artShotImagesModels_.add(stories[url].model);
  };
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              key: UniqueKey(),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(artShotImagesUrls_[_index % artShotImagesUrls_.length]),
                      fit: BoxFit.cover,
                    )
                ),

              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric( vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 69.0),
                    child: StoriesInfo(
                      title_: artShotImagesTitles_[_index % artShotImagesTitles_.length],
                      subTitle_: artShotImageSubTitles_[_index % artShotImageSubTitles_.length],
                      model_:artShotImagesModels_[_index % artShotImagesModels_.length],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        GestureDetector(
                          child: Icon(Icons.drag_indicator, size: 33,),
                        onTap: (){
/////////////////////////////

                          showModalBottomSheet<void>(
                            backgroundColor: Theme.of(context).colorScheme.tertiary,
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 450,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [

                                      Expanded(child: GemStoneWiewer()),

                                    Image.asset('assets/ecommerce/SBJ_logoLetters_only_white.png',height:30,),
                                      SizedBox(height: 10),
                                    // //Image.asset('assets/Models/SBJ_AR_Model_A.png', width: 240,),
                                    // //TODO: Create a BottomSheetTile with left header image and asset, then make it a listView>build element! and Include AR option and Social Media


                                      // ElevatedButton(
                                      //   child: const Text('Close', style: TextStyle(color: Colors.white),),
                                      //   onPressed: () => Navigator.pop(context),
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
/////////////////////////////
                            //summon the bottomSheet with a 3d Model or lottie
                        },),

                      GestureDetector(
                          child: Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png', width: 42,),
                          onTap: (){},
                      ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            // bottomSheet(),

          ],
        ),
      )
    );
  }
  // double currentSize
  Widget bottomSheet()=> DraggableScrollableSheet(
    initialChildSize: 0.24,
    minChildSize: 0.027,
    maxChildSize: 0.5,

    builder: (context, controller)=>ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12)),

      child: Container(
        color: Theme.of(context).colorScheme.tertiary,
        child: ListView(
        controller: controller,

        children: [

          // Icon(Icons.drag_handle_outlined, size: 42,),
          Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png', width: 42,),
          Image.asset('assets/Models/SBJ_AR_Model_A.png', width: 42,),
          //TODO: Create a BottomSheetTile with left header image and asset, then make it a listView>build element! and Include AR option and Social Media
        ],
                ),
      ),
    ),
  );

  Widget GemStoneWiewer()=>
    ModelViewer(
      // backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      backgroundColor: Colors.transparent,
      // src: 'assets/Models/3D/crystal_kyber.glb',
      src: '$url_$localName_',
      alt: 'A 3D model of an astronaut',
      ar: true,
      autoRotate: true,
      //iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      disableZoom: true,
    );

}


