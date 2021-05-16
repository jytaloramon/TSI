import 'package:flutter/material.dart';
import 'package:food/src/core/app_image.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/models/product.dart';
import 'package:food/src/screens/favorite//widgets/card_cart_widget.dart';
import 'package:food/src/screens/favorite/widgets/item_widget.dart';

class FavScreen extends StatelessWidget {
  static final productCart = [
    new Product(
        name: "Burger",
        description: "Burger X",
        price: 23.00,
        amount: 1,
        imageUrl: AppImage.beefBurger),
    new Product(
        name: "Bolo",
        description: "Chocolate Cake",
        price: 7.00,
        amount: 2,
        imageUrl: AppImage.cake),
    new Product(
        name: "Chicken Wing",
        description: "Pepper Chicken Wing",
        price: 20.00,
        amount: 1,
        imageUrl: AppImage.chickenWing),
    new Product(
        name: "Pizza",
        description: "Pizza Pepperoni",
        price: 45.00,
        amount: 2,
        imageUrl: AppImage.pizza)
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: productCart.length,
                  itemBuilder: (context, index) {
                    var product = productCart[index];
                    return CardCartWidget(
                      title: product.name.toString(),
                      image: product.imageUrl.toString(),
                      price: product.price,
                      description: product.description.toString(),
                      onAddTapped: () {},
                      onMinusTapped: () {},
                      onRemoveProduct: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
