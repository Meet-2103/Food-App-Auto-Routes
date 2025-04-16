import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_app_auto_router/core/navigation_routes/home_routes.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: HomeRoute.page,),
    AutoRoute(page: ProfileRoute.page,),
    AutoRoute(page: ProductDetailRoute.page,),
  ];
}
