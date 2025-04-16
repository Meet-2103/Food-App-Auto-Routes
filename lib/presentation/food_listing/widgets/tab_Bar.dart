import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/tab_content_grid.dart';

class FoodTabBar extends StatefulWidget {
  const FoodTabBar({super.key});

  @override
  State<FoodTabBar> createState() => _FoodTabBarState();
}

class _FoodTabBarState extends State<FoodTabBar> {
  int selectedIndex = 0;

  final List<String> tabs = [
    TextConstants.tabs1,
    TextConstants.tab2,
    TextConstants.tab3,
    TextConstants.tab4,
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(  //ask
                      color: isSelected
                          ? ColorConstants.bottomNavigation
                          : ColorConstants.sliderGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(        //ask should we extract
                        color: isSelected
                            ? ColorConstants.white
                            : ColorConstants.orderFavFood,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 41),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                TabContentGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }
