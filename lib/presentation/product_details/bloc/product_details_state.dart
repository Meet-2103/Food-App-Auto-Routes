

import 'package:equatable/equatable.dart';
import 'package:food_app_auto_router/domain/entity/product_entity.dart';

sealed class ProductState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitialState extends ProductState{}

class LoadedProductState extends ProductState {
  final int counter;
  final ProductEntity data;

  LoadedProductState({required this.counter, required this.data});

  @override
  List<Object?> get props => [counter, data];
}
//
// class LoadedProductState extends ProductState{
//   final int counter;
//   LoadedProductState({required this.counter});
// }


