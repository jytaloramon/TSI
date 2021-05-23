import 'package:flutter/material.dart';
import 'package:food/src/core/app_image.dart';
import 'package:food/src/core/app_text_styles.dart';
import 'package:food/src/models/product/product.dart';
import 'package:food/src/models/product/products_list.dart';
import 'package:food/src/screens/home/home_controller.dart';
import 'package:food/src/screens/home/widgets/card_category_widget.dart';
import 'package:food/src/screens/home/widgets/card_product_widget.dart';
import 'package:food/src/screens/home/widgets/search_widget.dart';
import 'package:food/src/screens/order/order_screen.dart';

class HomeScreen extends StatelessWidget {
  final categoryList = [
    {
      "title": "Burgers",
      "image": AppImage.beefBurger,
    },
    {
      "title": "Bolos",
      "image": AppImage.cake,
    },
    {
      "title": "Pizza",
      "image": AppImage.pizza,
    },
    {
      "title": "Snack",
      "image": AppImage.snack,
    },
  ];

  final productlist = {
    "burgers": [0, 6, 7, 8],
    "pizza": [5, 9, 10],
    "bolos": [1, 11, 12],
    "snack": [2, 3, 4]
  };

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Olá",
              style: AppTextStyles.title,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Vamos fazer seu pedido",
              style: AppTextStyles.heading,
            ),
          ),
          SearchWidget(),
          Container(
            height: 176,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: homeController.selectedCategoryNotifier,
                    builder: (context, value, _) => CardCategoryWidget(
                      title: categoryList[index]["title"].toString(),
                      image: categoryList[index]["image"].toString(),
                      selected: index == value,
                      onTap: () {
                        homeController.selectedCategory = index;
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: AppTextStyles.titleSemiBold,
                ),
                Text(
                  "Ver Todos >",
                  style: AppTextStyles.titleMedium3,
                )
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),
          ValueListenableBuilder(
            valueListenable: homeController.selectedCategoryNotifier,
            builder: (context, int value, _) {
              String? categoryKey = categoryList[value]["title"]!.toLowerCase();

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: productlist[categoryKey]!.length,
                itemBuilder: (context, index) {
                  Product product =
                      ProductsList.data[productlist[categoryKey]![index]];

                  return CardProductWidget(
                    title: product.name,
                    description: product.description,
                    image: product.imageUrl,
                    price: product.price,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderScreen(
                            id: productlist[categoryKey]![index],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
