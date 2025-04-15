import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/navigation_routes/app_router.gr.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      AutoRouter.of(context).push(HomeRoute());
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConstants.splashScreenTopGradient,
              ColorConstants.splashScreenBottomGradient,
              ]
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 282,
                left: 129,
                child: Text(TextConstants.splashScreenTitle,style: TextStyleConstants.splashScreenTitle,)),
            Positioned(
              top: 681,
                left: -42,
                child: Image.asset(TextConstants.splashScreenLeftImage,height: 288,width: 246,)),
            Positioned(
              top: 758,
                left: 134,
                child: Image.asset(TextConstants.splashScreenRightImage,height: 202,width: 202,)),
          ],
        ),
      ),
    );
  }
}
