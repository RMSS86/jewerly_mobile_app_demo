import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../Theme/ThemeProvider.dart';
import '../components/cart_item.dart';
import '../components/emptyCartTIle.dart';
import '../models/Cart.dart';
import '../models/jewerly.dart';



class CartPage extends StatefulWidget
{
    const CartPage({super.key});

    @override
    State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
{
    @override
    Widget build(BuildContext context) 
    {
        return Container(
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

            child: Consumer<Cart>(
                builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(height: 80.0),
                            //Header
                            const Text('My Cart',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            // const Text('Total',
                            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,),),
                            //

                            Expanded(
                                child:
                                value.getUserCart().isEmpty ?
                                    emptyCartTile() :
                                    ListView.builder(
                                        itemCount: value.getUserCart().length,
                                        itemBuilder: (context, index)
                                        {
                                            Jade individualJade_ = value.getUserCart()[index];

                                            return CartItem(
                                                jade: individualJade_
                                            );
                                        }
                                    )
                            )

                        ]
                    )
                ) 
            )
        );
    }
}
