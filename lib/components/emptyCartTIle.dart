import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class emptyCartTile extends StatelessWidget {
  const emptyCartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/UI/EmptyCart.json'),
          Text('Cart is Empty')
        ],
      ),
    );
  }
}
