import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/screens/order/widgets/button_shadow_widget.dart';
import 'package:food/src/util/app_icons_icons.dart';

class CardCartWidget extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final String description;
  final int id;
  final Function onMinusTapped;
  final Function onAddTapped;
  final Function onRemoveProduct;

  const CardCartWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.id,
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
                        ButtonShadowWidget(
                          icon: Icon(AppIcons.like, color: AppColors.colorRed),
                          onTap: this.onRemoveProduct,
                        )
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
