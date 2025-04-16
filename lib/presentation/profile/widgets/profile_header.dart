import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';

class ProfileHeaderBackground extends StatelessWidget {
  const ProfileHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.bottomNavigation,
            ColorConstants.splashScreenBottomGradient,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
