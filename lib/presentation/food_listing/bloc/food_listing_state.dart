
import 'package:equatable/equatable.dart';
import 'package:food_app_auto_router/domain/entity/product_entity.dart';

sealed class FoodListingState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitialFoodListingState extends FoodListingState{}

class LoadedFoodListingState extends FoodListingState {
  final List<ProductEntity> products;
  LoadedFoodListingState({required this.products});

  @override
  List<Object?> get props => [products];
}