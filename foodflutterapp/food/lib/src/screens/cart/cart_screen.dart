import 'package:flutter/material.dart';
import 'package:food/src/core/app_image.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/models/product.dart';
import 'package:food/src/screens/cart/widgets/button_confirm_widget.dart';
import 'package:food/src/screens/cart/widgets/card_cart_widget.dart';
import 'package:food/src/screens/cart/widgets/item_widget.dart';

class CartScreen extends StatelessWidget {
  static final productCart = [
    new Product(
        name: "Burger",
        description: "",
        price: 23.00,
        amount: 1,
        imageUrl: AppImage.beefBurger),
    new Product(
        name: "Bolo",
        description: "",
        price: 7.00,
        amount: 2,
        imageUrl: AppImage.cake),
    new Product(
        name: "Chicken Wing",
        description: "",
        price: 20.00,
        amount: 1,
        imageUrl: AppImage.chickenWing),
    new Product(
        name: "Hot Dog",
        description: "",
        price: 10.00,
        amount: 2,
        imageUrl: AppImage.hotDog),
    new Product(
        name: "Snack",
        description: "",
        price: 17.50,
        amount: 1,
        imageUrl: AppImage.snack),
    new Product(
        name: "Pizza",
        description: "",
        price: 45.00,
        amount: 2,
        imageUrl: AppImage.pizza)
  ];

  static double sumTotal() {
    var sum = 0.0;
    for (var prod in productCart) {
      sum += prod.amount * prod.price;
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    var sumTV = sumTotal();
    var taxa = 1.25;

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
                      amount: product.amount.toInt().toString(),
                      onAddTapped: () {},
                      onMinusTapped: () {},
                      onRemoveProduct: () {},
                    );
                  },
                ),
              ),
              ItemWidget(
                title: "Item total",
                value: "R\$ " + sumTV.toString(),
                styleTitle: AppTextStyles.subtitleMedium,
                styleValue: AppTextStyles.subtitleMedium14,
              ),
              ItemWidget(
                title: "Tax",
                value: "R\$ " + taxa.toString(),
                styleTitle: AppTextStyles.subtitleMedium,
                styleValue: AppTextStyles.subtitleMedium14,
              ),
              ItemWidget(
                title: "Total:",
                value: "R\$ " + (sumTV + taxa).toString(),
                styleTitle: AppTextStyles.titleSemiBold,
                styleValue: AppTextStyles.titleSemiBold,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 16,
          ),
          child: Row(
            children: [
              Expanded(child: ButtonConfirmWidget()),
            ],
          ),
        ),
      ],
    );
  }
}
