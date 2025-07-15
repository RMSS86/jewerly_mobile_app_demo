import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Theme/ThemeProvider.dart';
import '../UI/GalleryWidget/candyPosts_widget.dart';

class GalleryPage extends StatefulWidget
{
    const GalleryPage({super.key});

    @override
    State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
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

                child: GalleryListWidget()

            )
        );
    }
}
