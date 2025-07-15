import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),

      child: ListTile(
        leading: Image.asset(widget.jade.imagePath),
        title: Text(widget.jade.name),
        subtitle: Text(widget.jade.price),
        trailing: IconButton(onPressed: removeItemFromCart, icon: Icon(Icons.delete)),
      ),
    );
  }
}
