import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/domain/usecase/product_usercase.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_lisiting_event.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listing_state.dart';
import 'package:food_app_auto_router/domain/entity/product_entity.dart';


class FoodListingBloc extends Bloc<FoodListingEvent, FoodListingState> {
  final GetProductItems getProductItems;

  FoodListingBloc(this.getProductItems) : super(InitialFoodListingState()) {
    on<FoodLoadedEvent>(_foodLoaded);
  }

  Future<void> _foodLoaded(
      FoodLoadedEvent event, Emitter<FoodListingState> emit) async {
    try {
      final List<ProductEntity> products = await getProductItems.getProductItems();
      print(products);
      emit(LoadedFoodListingState(products: products));
    } catch (e) {
      emit(InitialFoodListingState());
      print("Error loading products: $e");
    }
  }
}
