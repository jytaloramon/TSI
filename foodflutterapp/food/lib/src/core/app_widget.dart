import 'package:flutter/material.dart';
import 'package:food/src/core/app_colors.dart';
import 'package:food/src/page_view/pages.dart';
import 'package:food/src/page_view/pages_controller.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PagesController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        theme: ThemeData(
          primaryColor: AppColors.colorDarkRed,
        ),
        home: Pages(),
      ),
    );
  }
}
