import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: TextField(
          onSubmitted: (e) => {},
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.colorGrey,
            ),
            hintText: "Pesquise nossos produtos",
            hintStyle: TextStyle(
              color: AppColors.colorGrey,
            ),
          ),
        ),
      ),
    );
  }
}
