import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 146,
      child: SizedBox(
        height: 139,
        width: 139,
        child: Image.asset(TextConstants.profileImage,fit: BoxFit.fill,),
      ),
      );

  }
}
