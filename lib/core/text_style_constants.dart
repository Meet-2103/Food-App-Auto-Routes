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

  static final productTitle=TextStyle(
    fontFamily: TextConstants.robotoFont,
    fontWeight: FontWeight.w600,
    fontSize: 25,
    height: 1.35,
    letterSpacing: 0,
    color: ColorConstants.orderFavFood,
  );

  static final ratingRow=TextStyle(
    fontFamily: TextConstants.robotoFont,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.35,
    letterSpacing: 0,
    color: ColorConstants.grey,
  );

  static final productDescription=TextStyle(
    fontFamily: TextConstants.robotoFont,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.72,
    letterSpacing: 0,
    color: ColorConstants.orderFavFood,
  );

  static final productPrice=TextStyle(
    fontFamily: TextConstants.robotoFont,
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 1.35,
    letterSpacing: 0,
    color: ColorConstants.white,
  );



}