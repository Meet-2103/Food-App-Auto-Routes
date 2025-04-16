import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/bottom_navigation_with_notch.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/product_appbar.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/search_and_filter.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/tab_Bar.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listiing_bloc.dart';
import 'package:food_app_auto_router/core/di/injection_container.dart' as inject;

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodListingBloc>(
      create: (context) => FoodListingBloc(inject.injector())..add(FoodLoadedEvent()),
      child: DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: HomePageAppBar(),
        body: SafeArea(
            child: Column(
              spacing: 40,
              children: [
                SizedBox(height: 41,),
                SearchAndFilterBar(),
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
    ));
  }
}

