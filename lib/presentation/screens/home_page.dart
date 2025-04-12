import 'package:flutter/material.dart';

import 'package:food_app_auto_router/presentation/widgets/search_and_filter.dart';
import 'package:food_app_auto_router/presentation/widgets/tab_Bar.dart';

import '../widgets/bottom_navigation_with_notch.dart';
import '../widgets/product_appbar.dart';

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
          shape: CircleBorder(),
            child: Icon(Icons.add,),
        ),
        bottomNavigationBar: BottomNavigationWithNotch(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
