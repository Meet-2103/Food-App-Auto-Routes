import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/product_appbar.dart';
import 'package:food_app_auto_router/presentation/profile/bloc/profile_bloc.dart';
import 'package:food_app_auto_router/presentation/profile/widgets/profile_content_card.dart';
import 'package:food_app_auto_router/presentation/profile/widgets/profile_header.dart';
import 'package:food_app_auto_router/presentation/food_listing/widgets/bottom_navigation_with_notch.dart';
import 'package:food_app_auto_router/presentation/profile/widgets/profile_photo.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: Scaffold(
        appBar: ProductDetailAppBar(backgroundColor: ColorConstants.bottomNavigation,),
        backgroundColor: ColorConstants.transparent,
        body: const Stack(
          children: [
            ProfileHeaderBackground(),
            ProfileContentCard(),
            ProfilePhoto(),
          ],
        ),
        bottomNavigationBar: const BottomNavigationWithNotch(),
      ),
    );
  }
}
