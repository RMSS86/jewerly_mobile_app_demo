import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/SplashPage.dart';
import 'models/Cart.dart';


void main(){
  runApp(eCommerce());
}

class eCommerce extends StatefulWidget {
  const eCommerce({super.key});

  @override
  State<eCommerce> createState() => _eCommerceState();
}

class _eCommerceState extends State<eCommerce> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> Cart(),
      builder: (context, child)=> const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Splashpage(),),

    );
  }
}

//TODO: Dialog Box every time user selects item to cart on keep adding Y/N go to cart, or AR product view.
///TODO: create on Jade Item category for 3D model of each piece to be played on AR.
