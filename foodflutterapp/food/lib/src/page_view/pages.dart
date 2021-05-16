import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/page_view/pages_controller.dart';
import 'package:food/src/page_view/widgets/bottom_navig_bar.dart';
import 'package:food/src/page_view/widgets/bottom_navig_bar_controller.dart';
import 'package:food/src/screens/cart/cart_screen.dart';
import 'package:food/src/screens/home/home_screen.dart';
import 'package:food/src/screens/favorite/fav_screen.dart';
import 'package:food/src/screens/home/widgets/home_app_bar_widget.dart';
import 'package:provider/provider.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  PageController? pageController;
  BottomNavigBarController bottomNavigBarController =
      BottomNavigBarController();

  @override
  Widget build(BuildContext context) {
    pageController = Provider.of<PagesController>(context).pageController;

    pageController!.addListener(
      () {
        bottomNavigBarController.tabSelected = pageController!.page!.toInt();
      },
    );

    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SafeArea(
          child: Scaffold(
            appBar: HomeAppBarWidget(),
            body: HomeScreen(),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigBar(
              bottomNavigBarController: bottomNavigBarController,
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text("Favoritos",
                    style: TextStyle(color: AppColors.colorBlack)),
                backgroundColor: Colors.transparent,
                bottomOpacity: 0.0,
                elevation: 0.0,
                centerTitle: true,
                toolbarHeight: 96),
            body: FavScreen(),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigBar(
              bottomNavigBarController: bottomNavigBarController,
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            body: CartScreen(),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigBar(
              bottomNavigBarController: bottomNavigBarController,
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text("Perfil")),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigBar(
              bottomNavigBarController: bottomNavigBarController,
            ),
          ),
        ),
      ],
    );
  }
}
