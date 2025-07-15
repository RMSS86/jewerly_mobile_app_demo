import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Theme/ThemeProvider.dart';
import '../components/GeneralDrawer.dart';

class ArtistsPage extends StatefulWidget
{
    const ArtistsPage({super.key});

    @override
    State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage>
{
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
}
