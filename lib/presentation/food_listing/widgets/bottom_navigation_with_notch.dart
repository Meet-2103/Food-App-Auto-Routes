import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/navigation_routes/app_router.gr.dart';
import 'package:food_app_auto_router/core/text_constants.dart';


class BottomNavigationWithNotch extends StatelessWidget {
  const BottomNavigationWithNotch({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 90,
      shape: CircularNotchedRectangle(),
      notchMargin: 25,
      color: ColorConstants.bottomNavigation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              AutoRouter.of(context).push(HomeRoute());
            },
              child: SvgPicture.asset(TextConstants.homeIcon,color: ColorConstants.white,)),
          GestureDetector(
            onTap: (){
              AutoRouter.of(context).push(ProfileRoute());
            },
              child: SvgPicture.asset(
                TextConstants.userIcon,color: ColorConstants.white,)),
          SizedBox(width: 40,),
          GestureDetector(child: SvgPicture.asset(TextConstants.commentIcon,color: ColorConstants.white,)),
          GestureDetector(child: SvgPicture.asset(TextConstants.heartIcon,color: ColorConstants.white,)),
        ],
      ),
    );
  }
}
