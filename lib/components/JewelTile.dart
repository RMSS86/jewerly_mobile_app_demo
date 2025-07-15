import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Theme/ThemeProvider.dart';
import '../models/jewerly.dart';

class JewelTile extends StatelessWidget {
  Jade jade_;
  void Function()? onTap_;

  JewelTile({super.key,
    required this.jade_,
    required this.onTap_
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          /// Jade pic
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(jade_.imagePath)),

          Image.asset(
              'assets/ecommerce/SBJ_logoLetters_only_white.png',width: 140,
          ),
          /// description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(jade_.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          ),


          /// price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // jade name
                    Text(jade_.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),

                  //price
                    const SizedBox(height: 5,),
                    Text('\$' + jade_.price,
                    style:  TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),),

                  ],

                ),
                //plus Button
                GestureDetector(
                  onTap: onTap_,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration:   BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceDim,
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(12),
                          bottomRight:Radius.circular(12),)
                      ),
                      child:  Icon(Icons.add, color: Colors.white,)),
                ),
              ],
            ),
          )


          /// button to add to cart
        ],
      ),
    );
  }
}
