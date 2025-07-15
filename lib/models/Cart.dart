import 'package:flutter/cupertino.dart';

import 'jewerly.dart';

class Cart extends ChangeNotifier{

List<Jade> jadeShop =[

  Jade(
      name: 'Green Jade',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_02.png',
      description: ' Protection & Calm ',
      collection: 'M5[ 23 ]01',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Green Jade',
      price: '299.99',
      imagePath: 'assets/ecommerce/jadeCandy_04.png',
      description: ' Inner Peace & Love ',
      collection: 'M7[ 23 ]01',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Blue Green Jade',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_05.png',
      description: ' Intelligence ',
      collection: 'M5[ 23 ]03',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Green Jade',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_06.png',
      description: ' Intelligence ',
      collection: 'M5[ 23 ]03',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Green Jade',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_07.png',
      description: ' Inner Peace ',
      collection: 'M7[ 23 ]01',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Rutilated Quartz',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_08.png',
      description: ' Wealth ',
      collection: 'M7[ 23 ]01',
      jadeType: 'Green Nephrite Jade'),

  Jade(
      name: 'Green Jade',
      price: '199.99',
      imagePath: 'assets/ecommerce/jadeCandy_09.png',
      description: ' Inner Peace ',
      collection: 'M7[ 23 ]01',
      jadeType: 'Green Nephrite Jade'),

  ];

List<Jade> userCart = [];

List<Jade> getJadeList(){
  return jadeShop;
}

List<Jade> getUserCart(){
  return userCart;
}

void addItemToCart(Jade jade){
  userCart.add(jade);
  notifyListeners();
}

void removeItemFromCart(Jade jade){
  userCart.remove(jade);
  notifyListeners();

}

}