import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

import '../../../core/color_constants.dart';
import '../bloc/food_lisiting_event.dart';
import '../bloc/food_listiing_bloc.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Row(
        spacing: 13,
        children: [
          Expanded(
            child:Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x26000000), // 15% of black (0x26 = 15%)
                    offset: const Offset(0, 4),
                    blurRadius: 19,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (query) {
                  context.read<FoodListingBloc>().add(SearchFoodEvent(query));
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                  hintText: TextConstants.search,
                ),
                style: const TextStyle(
                  fontFamily: 'Roboto', // if you're using Roboto in your theme
                ),
              ),
            )
          ),
          SvgPicture.asset(TextConstants.settingIcon,),

        ],
      ),
    );
  }
}
