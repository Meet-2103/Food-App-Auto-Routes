import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

import '../../../core/color_constants.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:SvgPicture.asset(TextConstants.searchIcon,color: ColorConstants.searchIcon,height: 24,width: 24,),
                hintText: TextConstants.search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
        ),
        SvgPicture.asset(TextConstants.settingIcon,),
      ],
    );
  }
}
