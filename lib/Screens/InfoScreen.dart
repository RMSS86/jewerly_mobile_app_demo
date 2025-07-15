import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import '../Theme/ThemeProvider.dart';
import '../components/GeneralDrawer.dart';

class InfoScreen extends StatelessWidget
{
    const InfoScreen({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            extendBodyBehindAppBar: true,//ANDROID ONLY
            extendBody: true, //ANDROID ONLY

            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: AssetImage(
                            Provider.of<ThemeProvider>(context).isDarkMode == true ?
                                'assets/ecommerce/jadeCandy_polar_mosaic_white.png' :
                                'assets/ecommerce/jadeCandy_polar_mosaic.png'
                        ),

                        fit: BoxFit.fill

                    )
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SizedBox(height: 90.0),
                        Image.asset(Provider.of<ThemeProvider>(context).isDarkMode == true ?
                                'assets/ecommerce/SBJ_logoLetters_only_white.png' :
                                'assets/ecommerce/SBJ_logoLetters_only_black.png', width: 240 ),
                        SizedBox(height: 24.0),

                        Image.asset('assets/ecommerce/OptimizedCubeLogo_plus_Letters_A.png', width: 180),

                        SizedBox(height: 24.0),

                        Text('Created in 2019 StrawBerry & Jades,'),
                        Text('was founded by the Stevenson brothers'),

                        Expanded(child: Container(
                                child: gemStoneViewer()
                            )),

                        Text('Designer: Robbie Trevor Stevenson'),
                        Text('StrawBerry & Jades Prototype 2024'),
                        SizedBox(height: 30.0)

                    ]
                )
            ),

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

            drawer: Drawer_()
        );
    }
    Widget gemStoneViewer() =>
    Container(
        margin: const EdgeInsets.all(72),
        child: const ModelViewer(
            backgroundColor: Colors.transparent,
            src: 'assets/Models/3D/jade_totoro.glb',
            alt: 'A 3D model jade Totoro :) ',
            ar: false,
            autoRotate: true,
            //iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
            disableZoom: true
        )
    );
}
