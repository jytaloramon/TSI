import 'package:flutter/material.dart';
import 'package:food/src/models/product/product.dart';
import 'package:food/src/models/product/products_list.dart';
import 'package:food/src/screens/favorite//widgets/card_cart_widget.dart';
import 'package:food/src/models/favorite/favorite.dart';

class FavScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavScreenState();
}

class FavScreenState extends State<FavScreen> {
  List<Product> getProductCart() {
    List<Product> products = [];

    for (var id in Favorite.dataId) {
      products.add(ProductsList.data[id]);
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productCart = getProductCart();

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
                      id: index,
                      description: product.description.toString(),
                      onAddTapped: () {},
                      onMinusTapped: () {},
                      onRemoveProduct: () {
                        setState(() {
                          Favorite.dataId.removeAt(index);
                        });
                      },
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
