import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

class TextStyleConstants{

  static final splashScreenTitle=TextStyle(
    fontFamily: TextConstants.splashScreenTitleFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 40,
    height: 1,
    letterSpacing: 0,
    color: ColorConstants.white,
  );

  static final homePageTitle=TextStyle(
    fontFamily: TextConstants.splashScreenTitleFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 1.35,
    letterSpacing: 0,
    color: ColorConstants.homePageTitle,
  );

  static final orderFavFood=TextStyle(
    fontFamily: TextConstants.orderFavFoodFont,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.35,
    letterSpacing: 0,
    color: ColorConstants.orderFavFood,
  );



}