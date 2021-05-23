import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';

class ButtonAddCart extends StatefulWidget {
  final VoidCallback onTap;

  const ButtonAddCart({Key? key, required this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonAddCartState(onTap: this.onTap);
}

class ButtonAddCartState extends State<ButtonAddCart> {
  final VoidCallback onTap;

  ButtonAddCartState({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap
      ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: AppColors.colorRed,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              Expanded(
                child: Text(
                  "Add no carrinho",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
