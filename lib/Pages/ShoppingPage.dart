import 'package:flutter/material.dart';
import 'package:jadecandyv1/Pages/CartPage.dart';
import 'package:provider/provider.dart';

import '../Theme/ThemeProvider.dart';
import '../components/JewelTile.dart';
import '../models/Cart.dart';
import '../models/jewerly.dart';

class ShoppingPage extends StatefulWidget
{
    const ShoppingPage({super.key});

    @override
    State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage>
{
    void addJadeToCart(Jade jade) 
    {
        Provider.of<Cart>(context, listen: false).addItemToCart(jade);

    }

    void addingToCartPermission(Jade jade) 
    {
        //adv the user about the change
        showDialog(context: context,
            builder: (context) => AlertDialog(
                title: Text('Nice Selection'),
                content: Text('Adding this to Cart?'),
                icon: Icon(Icons.shopping_cart),
                actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface))
                    ),

                    ElevatedButton(
                        onPressed: ()
                        {
                            Navigator.pop(context);
                            addJadeToCart(jade);
                            // goToCart();
                        },
                        child: Text('Yes, Add To Cart', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface))

                    )
                ]
            )
        );
    }

    void goToCart() 
    {
        //adv the user about the change
        showDialog(context: context,
            builder: (context) => AlertDialog(
                title: const Text('Go To Cart?'),
                content: const Text('Would you Like to review your Cart?'),
                icon: const Icon(Icons.shopping_cart),
                actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface))
                    ),

                    ElevatedButton(
                        onPressed: ()
                        {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));

                        },
                        child: Text('Yes, Go To Cart?', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface))

                    )
                ]
            )
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Consumer<Cart>(builder: (context, value, child) => Container(
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

                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50.0)
                        ),

                        ///search bar
                        Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const[
                                    Text('Search',
                                        style: TextStyle(color: Colors.grey)),
                                    Icon(Icons.search, color: Colors.grey)
                                ]
                            )
                        ),

                        ///message
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Wear the Vibe that Can Be Noticed',
                                style: TextStyle(color: Colors.grey))
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
                                            fontSize: 24)
                                    ),
                                    Hero(
                                        tag: 'logo_swap',
                                        child: Image.asset('assets/ecommerce/OptimizedCubeLogo_A.png',
                                            height: 42
                                        )
                                    ),
                                    Text('see all',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                                ]
                            )
                        ),
                        const SizedBox(height: 1),

                        Expanded(
                            child: ListView.builder(
                                itemCount: value.getJadeList().length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (context, index)
                                {

                                    Jade _jade = value.getJadeList()[index];

                                    return JewelTile(
                                        onTap_: () => addingToCartPermission(_jade), ///
                                        jade_: _jade
                                    );
                                }
                            )
                        ),

                        const Padding(padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                            child: Divider(
                                color: Colors.transparent
                            ))
                    ]//////LIST OF ELEMENTS INSIDE LANDING PAGE!

                )
            )
        );
    }
}
