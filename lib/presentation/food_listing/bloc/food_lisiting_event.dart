import 'package:equatable/equatable.dart';

sealed class FoodListingEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SearchFoodEvent extends FoodListingEvent {
  final String query;

  SearchFoodEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class FoodLoadingEvent extends FoodListingEvent{}

class FoodLoadedEvent extends FoodListingEvent{}