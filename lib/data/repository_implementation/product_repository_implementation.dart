


import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/product_data_source.dart';

class ProductRepositoryImplementation extends ProductRepository{
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<List<ProductEntity>> getProductItems() async{
    return await remoteDataSource.fetchProductItems();
  }

  @override
  Future<ProductEntity> getProductItemById(int id) async{             //problem can be in data varibale
    List<ProductEntity> data= await remoteDataSource.fetchProductItemsById(id);
    return data[0];
  }

}
