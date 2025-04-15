import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listiing_bloc.dart';
import 'package:food_app_auto_router/core/di/injection_container.dart' as di;
import 'core/navigation_routes/app_router.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});z
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodListingBloc>(
          create: (context) => FoodListingBloc(di.sl())..add(FoodLoadedEvent()),
        ),
      ],
      child: MaterialApp.router(
        // theme: ,
        debugShowCheckedModeBanner: false,
        // home: ProductDetailScreen(),
        routerConfig: _appRouter.config(),
      ),
    );
  }

}

//switch

//bloc
