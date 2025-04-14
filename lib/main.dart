import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listiing_bloc.dart';
import 'package:food_app_auto_router/presentation/food_listing/screens/home_page.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'package:food_app_auto_router/core/di/injection_container.dart' as di;


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(di.sl())..add(LoadingProduct()),
        ),
        BlocProvider<FoodListingBloc>(
          create: (context) => FoodListingBloc(di.sl())..add(FoodLoadedEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }

}
