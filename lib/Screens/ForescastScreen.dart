import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Theme/ThemeProvider.dart';
import '../components/Forecast/Forecast.dart';
import '../components/GeneralDrawer.dart';

class ForecastScreen extends StatefulWidget
{
    const ForecastScreen({super.key});

    @override
    State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen>
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
                ),

                child: ClipRRect(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.inverseSurface

                        ),

                        margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 90, bottom: 30),
                        child: Column(
                            children: [
                                Text("Today's Forecast",
                                    style: GoogleFonts.bebasNeue(fontSize: 30,
                                        color: Theme.of(context).colorScheme.inversePrimary)),

                                WeatherPage(),
                                ClipRRect(
                                    child: Expanded(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                                Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [

                                                        ClipRect(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(12),
                                                                    color: Theme.of(context).colorScheme.tertiary

                                                                ),
                                                                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                                                                margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 10, bottom: 10),

                                                                child: Text("section A",
                                                                    style: GoogleFonts.bebasNeue(fontSize: 30,
                                                                        color: Colors.grey.shade300))

                                                            )
                                                        ),

                                                        ClipRRect(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(12),
                                                                    color: Theme.of(context).colorScheme.tertiary

                                                                ),
                                                                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 45),
                                                                margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 10, bottom: 10),

                                                                child: Text("section C",
                                                                    style: GoogleFonts.bebasNeue(fontSize: 30,
                                                                        color: Colors.grey.shade300))

                                                            )
                                                        )
                                                    ]
                                                ),

                                                ClipRRect(

                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Theme.of(context).colorScheme.tertiary

                                                        ),

                                                        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 99),
                                                        margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 10, bottom: 10),

                                                        child: Text("section B",
                                                            style: GoogleFonts.bebasNeue(fontSize: 30,
                                                                color: Colors.grey.shade300))

                                                    )
                                                )
                                            ]
                                        )
                                    )
                                )

                            ]
                        )
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
