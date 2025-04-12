

import 'package:food_app_auto_router/domain/entity/product_entity.dart';
import 'package:food_app_auto_router/domain/repository/product_repository.dart';


class GetProductItems{
  final ProductRepository repo;
  GetProductItems({required this.repo});

  Future<List<ProductEntity>>getProductItems()async{
    return await repo.getProductItems();
  }

  Future<ProductEntity>getProductItemById(int id)async{
    return await repo.getProductItemById(id);
  }

}
