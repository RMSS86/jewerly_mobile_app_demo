import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jadecandyv1/main_.dart';
import 'package:provider/provider.dart';
import '../models/Cart.dart';
import '../models/jewerly.dart';

class CartItem extends StatefulWidget {
  Jade jade;

  CartItem({
    super.key,
    required this.jade
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart (){
    Provider.of<Cart>(context, listen:false).removeItemFromCart(widget.jade);
  }
  void removeFromCartItem(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.delete, size: 90,),
        content: const Text('Removing this Item from your Cart?'),

        actions: [
          MaterialButton(
            onPressed: ()=> Navigator.pop(context),
            child: Text('Cancel'),
          ),

          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
              removeItemFromCart();
            },
            child: Text('Remove from Cart'),

          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {




    return Container(
      decoration: BoxDecoration(

        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: Image.asset(widget.jade.imagePath),
        title: Text(widget.jade.name),
        subtitle: Text(widget.jade.price),
        trailing: IconButton(onPressed: (){removeFromCartItem();}, icon: Icon(Icons.delete)),
      ),
    );
  }
}
