import 'package:flutter/material.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/models/cart/cart.dart';
import 'package:food/src/models/product/product_purchase.dart';
import 'package:food/src/screens/cart/widgets/button_confirm_widget.dart';
import 'package:food/src/screens/cart/widgets/card_cart_widget.dart';
import 'package:food/src/screens/cart/widgets/item_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final productCart = Cart.data;

  static double sumTotal(List<ProductPurchase> productCart) {
    var sum = 0.0;
    for (var prod in productCart) sum += prod.amount * prod.price;

    return sum;
  }

  void alterMount(ProductPurchase productPurchase, int value) {
    if (productPurchase.amount + value < 1) return;

    setState(() {
      productPurchase.amount += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sumTV = sumTotal(productCart);
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
                      idx: index,
                      onAddTapped: () {
                        alterMount(product, 1);
                      },
                      onMinusTapped: () {
                        alterMount(product, -1);
                      },
                      onRemoveProduct: () {
                        setState(() {
                          productCart.remove(product);
                        });
                      },
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
