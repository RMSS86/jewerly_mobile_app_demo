import 'package:flutter/material.dart';
import 'package:jadecandyv1/Theme/ThemeProvider.dart';
import 'package:provider/provider.dart';
import '../Pages/LandingPage.dart';
import '../Animations/AnimatedTransition.dart';
class Splashpage extends StatefulWidget
{
    const Splashpage({super.key});

    @override
    State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage>
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(

            backgroundColor: Theme.of(context).colorScheme.primary,
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
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            ///LOGO
                            Padding(

                                padding: const EdgeInsets.all(70.0),
                                child: Hero(
                                    tag: 'logo_swap',
                                    child: Image.asset('assets/ecommerce/OptimizedCubeLogo_plus_Letters_A.png',
                                        height: 306
                                    )
                                )
                            ),
                            //////////////////////////////////////////
                            ///padding sapce beewteen
                            const SizedBox(height: 1),
                            //////////////////////////////////////////
                            /// TEXT INFO title
                            Text("STRAWBERRY & JADES",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26
                                )
                            ),
                            //////////////////////text B
                            const SizedBox(height: 0.5 ),
                            Text("[ Instantly Sweeten your Vibe / JadeCandy ]",
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    fontSize: 14
                                )
                            ),

                            /////////////////////////////////////////
                            /// START NOW BuTTON
                            const SizedBox(height: 50 ),
                            GestureDetector(
                                onTap: ()
                                {
                                    Navigator.push(
                                        context, _animatedRoute(LandingPage())
                                    );
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.surfaceDim,
                                        borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    padding: const EdgeInsets.all(25.0),
                                    child: const Center(
                                        child: Text('Vibe Now',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)
                                        )
                                    )
                                )
                            )
                        ]
                    )
                )
            )
        );
    }

    static Route _animatedRoute(Widget _child) 
    {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secundaryAnimation) => _child,
            transitionsBuilder: (context, animation, secundaryAnimation, _child)
            {
                const begin = Offset(1.0, 0.1);
                const end = Offset.zero;
                const curve = Curves.decelerate;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(position: animation.drive(tween),
                    child: _child

                );

            }
        );
    }
}
