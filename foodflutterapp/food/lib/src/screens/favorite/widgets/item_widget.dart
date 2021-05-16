import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String value;
  final TextStyle styleTitle;
  final TextStyle styleValue;

  const ItemWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.description,
    required this.styleTitle,
    required this.styleValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            this.title,
            style: this.styleTitle,
          )),
          Expanded(
            child: Text(
              this.description,
              style: this.styleValue,
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Text(
              this.value,
              style: this.styleValue,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
