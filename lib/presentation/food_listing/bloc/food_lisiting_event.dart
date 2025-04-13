



import 'package:equatable/equatable.dart';

sealed class FoodListingEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class FoodLoadingEvent extends FoodListingEvent{}

class FoodLoadedEvent extends FoodListingEvent{}