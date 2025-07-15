import 'package:flutter/material.dart';
import 'LandingPage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///LOGO
                Padding(
                    padding: const EdgeInsets.all(70.0),
                    child: Image.asset('assets/ecommerce/SBJ_logo_Stand_One.png',
                      height: 300,
                    ),
                ),
                //////////////////////////////////////////
                ///padding sapce beewteen
                const SizedBox(height: 1,),
                //////////////////////////////////////////
                /// TEXT INFO title
                Text("STRAWBERRY & JADES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                ),
                //////////////////////text B
                const SizedBox(height: 0.5 ,),
                Text("[ Instantly Sweeten your Vibe / JadeCandy ]",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                /////////////////////////////////////////
                /// START NOW BuTTON
                const SizedBox(height: 50 ,),
                GestureDetector(
                  onTap: ()=>Navigator.push(
                      context, MaterialPageRoute(
                    builder:
                        (context) => LandingPage(),
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding:const  EdgeInsets.all(25.0),
                    child: const Center(
                      child: Text('Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
