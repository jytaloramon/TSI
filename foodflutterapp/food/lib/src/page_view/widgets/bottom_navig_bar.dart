import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/page_view/pages_controller.dart';
import 'package:food/src/page_view/widgets/bottom_navig_bar_controller.dart';
import 'package:food/src/util/app_icons_icons.dart';
import 'package:provider/provider.dart';

class BottomNavigBar extends StatelessWidget {
  BottomNavigBarController bottomNavigBarController;
  BottomNavigBar({required this.bottomNavigBarController});

  PageController? pageController;

  void onItemTapped(int index) {
    pageController!.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    pageController = Provider.of<PagesController>(context).pageController;

    return ValueListenableBuilder(
      valueListenable: bottomNavigBarController.tabSelectedNotifier,
      builder: (context, int value, _) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Home",
            backgroundColor: AppColors.colorLightGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.like_outline),
            label: "Favoritos",
            backgroundColor: AppColors.colorLightGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Carrinho",
            backgroundColor: AppColors.colorLightGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Perfil",
            backgroundColor: AppColors.colorLightGrey,
          ),
        ],
        selectedItemColor: AppColors.colorRed,
        unselectedItemColor: AppColors.colorGrey,
        showUnselectedLabels: true,
        currentIndex: value,
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
        elevation: 20,
      ),
    );
  }
}
