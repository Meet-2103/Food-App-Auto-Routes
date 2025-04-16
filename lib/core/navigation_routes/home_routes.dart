

import 'package:auto_route/auto_route.dart';
import 'package:food_app_auto_router/core/navigation_routes/app_router.gr.dart';
import 'package:food_app_auto_router/core/navigation_routes/profile_route.dart';

final AutoRoute homeRoute=AutoRoute(
    page: HomeRoute.page,
children: [
  profileRoute,
]
);