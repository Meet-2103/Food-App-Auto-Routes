import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';



class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 100,
      title: Text(TextConstants.splashScreenTitle,style: TextStyleConstants.homePageTitle,),
      subtitle: Text(TextConstants.orderFavFood,style: TextStyleConstants.orderFavFood,),
      trailing: CircleAvatar(
        radius: 30,
           child: Image.asset(TextConstants.profileImage,),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
