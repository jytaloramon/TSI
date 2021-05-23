import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/models/cart/cart.dart';
import 'package:food/src/models/favorite/favorite.dart';
import 'package:food/src/models/product/product.dart';
import 'package:food/src/models/product/product_purchase.dart';
import 'package:food/src/models/product/products_list.dart';
import 'package:food/src/screens/order/widgets/around_amount_widget.dart';
import 'package:food/src/screens/order/widgets/button_add_cart.dart';
import 'package:food/src/screens/order/widgets/button_shadow_widget.dart';
import 'package:food/src/screens/order/widgets/size_product_widget.dart';
import 'package:food/src/util/app_icons_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderScreen extends StatefulWidget {
  final int id;

  OrderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  ProductPurchase mountOrder(Product product) {
    return new ProductPurchase(
        name: product.name,
        description: product.description,
        price: product.price,
        amount: 1,
        dimension: 'P',
        imageUrl: product.imageUrl);
  }

  @override
  State<StatefulWidget> createState() => OrderScreenState(
      id: this.id, productPurchase: mountOrder(ProductsList.data[id]));
}

class OrderScreenState extends State<OrderScreen> {
  final int id;
  final ProductPurchase productPurchase;

  OrderScreenState({required this.id, required this.productPurchase});

  void alterMount(int value) {
    if (productPurchase.amount + value < 1) return;

    setState(() {
      productPurchase.amount += value;
    });
  }

  void alterLike() {
    setState(() {
      Favorite.isExistId(this.id)
          ? Favorite.dataId.remove(this.id)
          : Favorite.dataId.add(this.id);
    });
  }

  void alterDimension(String dimension) {
    setState(() {
      productPurchase.dimension = dimension;
    });
  }

  bool isDimensionSelected(String dimension) {
    return productPurchase.dimension == dimension;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonShadowWidget(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ButtonShadowWidget(
                          icon: Icon(
                              Favorite.isExistId(this.id)
                                  ? AppIcons.like
                                  : AppIcons.like_outline,
                              color: AppColors.colorRed),
                          onTap: () {
                            alterLike();
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 70, right: 70),
                      child: Text(
                        productPurchase.name,
                        style: AppTextStyles.titleSemiBold,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 70, right: 70),
                      child: Text(
                        productPurchase.description,
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(productPurchase.imageUrl),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizeProductWidget(
                            title: "P",
                            selected: isDimensionSelected("P"),
                            onTap: () {
                              alterDimension("P");
                            },
                          ),
                          SizeProductWidget(
                            title: "M",
                            selected: isDimensionSelected("M"),
                            onTap: () {
                              alterDimension("M");
                            },
                          ),
                          SizeProductWidget(
                            title: "G",
                            selected: isDimensionSelected("G"),
                            onTap: () {
                              alterDimension("G");
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AroundAmountWidget(
                            icon: Icons.remove,
                            onTap: () {
                              alterMount(-1);
                            },
                          ),
                          SizedBox(width: 50),
                          Text(
                            productPurchase.amount.toString(),
                            style: AppTextStyles.letterAmount,
                          ),
                          SizedBox(width: 50),
                          AroundAmountWidget(
                            icon: Icons.add,
                            onTap: () {
                              alterMount(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 19),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Preço",
                                style: AppTextStyles.heading,
                              ),
                              Text(
                                "R\$ ${productPurchase.price}",
                                style: AppTextStyles.letterAmount,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ButtonAddCart(
                          onTap: () {
                            Cart.data.add(productPurchase);

                            Fluttertoast.showToast(
                              msg: "Adicionado!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );

                            sleep(const Duration(seconds: 1));
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
