import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/presentation/widgets/home_screen_tabs.dart';

class FoodTabBar extends StatelessWidget {
  const FoodTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              TabBar(
                isScrollable: true,
                // labelPadding: EdgeInsets.symmetric(horizontal: 14),
                labelColor: ColorConstants.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                unselectedLabelColor: ColorConstants.orderFavFood,
                indicator: BoxDecoration(
                  color: ColorConstants.bottomNavigation,
                  borderRadius: BorderRadius.circular(20),
                ),
                // labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                tabs: [
                  HomeScreenTabs(name: TextConstants.tabs1),
                  HomeScreenTabs(name: TextConstants.tab2),
                  HomeScreenTabs(name: TextConstants.tab3),
                  HomeScreenTabs(name: TextConstants.tab4),
                ],
              ),
            ],
          ),
          SizedBox(height:41),
          Expanded(
            child: TabBarView(children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    ),
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){},
                        child: Column(),
                      );
                    })
            ]),
          ),
        ],
      
      ),
    );

  }
}
