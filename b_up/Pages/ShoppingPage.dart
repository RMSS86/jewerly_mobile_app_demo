import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/JewelTile.dart';
import '../models/Cart.dart';
import '../models/jewerly.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  void addJadeToCart(Jade jade){
    Provider.of<Cart>(context, listen:false).addItemToCart(jade);

    //adv the user about the change
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Succesfully Added!'),
      content: Text('Check Your Cart'),
      icon: Icon(Icons.shopping_cart),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
        ),

        ///search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Search',
                style: TextStyle(color: Colors.grey),),
              Icon(Icons.search, color: Colors.grey,),
            ],
          ),
        ),

        ///message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text('Wear the Vibe that Can Be Noticed',
            style: TextStyle(color: Colors.grey),),
        ),

        /// ///Hot Pick!
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Hot Picks',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),

              Text('see all',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)),
            ],
          ),
        ),
        const SizedBox(height: 1),

        Expanded(
          child: ListView.builder(
            itemCount: value.getJadeList().length,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {

              Jade _jade = value.getJadeList()[index];

              return JewelTile(
                onTap_: ()=>addJadeToCart(_jade),
                jade_: _jade,
              );
            },
          ),
        ),

        const Padding(padding: EdgeInsets.only(top:25.0, left:25.0, right:25.0),
          child: Divider(
            color: Colors.transparent,
          ),)
      ],//////LIST OF ELEMENTS INSIDE LANDING PAGE!

    )
    );
  }
}
