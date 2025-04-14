import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/domain/usecase/product_usercase.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listing_state.dart';
import 'package:food_app_auto_router/domain/entity/product_entity.dart';


class FoodListingBloc extends Bloc<FoodListingEvent, FoodListingState> {
  final GetProductItems getProductItems;
  List<ProductEntity> _products=[];
  FoodListingBloc(this.getProductItems) : super(InitialFoodListingState()) {
    on<FoodLoadedEvent>(_foodLoaded);
    on<SearchFoodEvent>(_searchFood);
  }

  Future<void> _foodLoaded(
      FoodLoadedEvent event, Emitter<FoodListingState> emit) async {
    try {
      _products = await getProductItems.getProductItems();
      print(_products);
      emit(LoadedFoodListingState(products: _products));
    } catch (e) {
      print("Error loading products: $e");
    }
  }

  void _searchFood(SearchFoodEvent event, Emitter<FoodListingState> emit) {
    final query = event.query.toLowerCase();
    final filtered = _products
        .where((product) => product.title.toLowerCase().contains(query))
        .toList();
    emit(LoadedFoodListingState(products: filtered));
  }

}
