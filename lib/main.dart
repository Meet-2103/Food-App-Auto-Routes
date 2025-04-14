import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/data/data_source/product_data_source.dart';
import 'package:food_app_auto_router/data/repository_implementation/product_repository_implementation.dart';
import 'package:food_app_auto_router/domain/usecase/product_usercase.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listiing_bloc.dart';
import 'package:food_app_auto_router/presentation/food_listing/screens/home_page.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'core/network_service/api_client.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final remoteDataSource = ProductRemoteDataSource(apiClient: apiClient);
    final repository = ProductRepositoryImplementation(remoteDataSource: remoteDataSource);
    final getShoppingCartItems = GetProductItems(repo: repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(getShoppingCartItems)..add(LoadingProduct()),
        ),
        BlocProvider<FoodListingBloc>(
          create: (context) => FoodListingBloc(getShoppingCartItems)..add(FoodLoadedEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }

}
