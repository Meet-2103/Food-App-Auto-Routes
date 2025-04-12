

import 'package:food_app_auto_router/domain/entity/product_entity.dart';

sealed class ProductState{}

class InitalState extends ProductState{}

class LoadingProductState extends ProductState{
  final ProductEntity data;
  LoadingProductState({required this.data});
}


class LoadedProductState extends ProductState{
  final int counter;
  LoadedProductState({required this.counter});
}


