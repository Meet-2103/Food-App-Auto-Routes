import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

class ProductDetailAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.white,
      leading: IconButton(onPressed: (){
        context.pop();
      },
          icon: Icon(Icons.arrow_back_sharp,size: 28,),),
      actions: [Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: SvgPicture.asset(TextConstants.searchIcon,height: 20,width: 20,),
      ),],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
