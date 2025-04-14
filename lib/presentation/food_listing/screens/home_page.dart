import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import '../widgets/bottom_navigation_with_notch.dart';
import '../widgets/product_appbar.dart';
import '../widgets/search_and_filter.dart';
import '../widgets/tab_Bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: HomePageAppBar(),
        body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 47,),
                SearchAndFilterBar(),
                SizedBox(height: 41,),
                FoodTabBar(),
              ],
            ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
          backgroundColor: ColorConstants.bottomNavigation,
          shape: CircleBorder(),
            child: Icon(Icons.add,color: ColorConstants.white,size: 30,),
        ),
        bottomNavigationBar: BottomNavigationWithNotch(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
