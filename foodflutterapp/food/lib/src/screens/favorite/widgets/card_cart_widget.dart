import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/core/app_image.dart';
import 'package:food/src/core/app_text_styles.dart';

class CardCartWidget extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final String description;
  final Function onMinusTapped;
  final Function onAddTapped;
  final Function onRemoveProduct;

  const CardCartWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.onMinusTapped,
    required this.onAddTapped,
    required this.onRemoveProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(-4, -4), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.black45.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(4, 4), // changes position of shadow
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Image.asset(this.image)),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 5, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          this.title,
                          style: AppTextStyles.subtitle17,
                        ),
                        InkWell(
                            onTap: () => this.onRemoveProduct(),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 8, bottom: 8),
                                  child: Image.asset(AppImage.heart.toString(),
                                      width: 24, height: 24)),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            this.description,
                            style: AppTextStyles.subtitle14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "R\$ ${this.price.toStringAsFixed(2)}",
                        style: AppTextStyles.subtitle17,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
