import 'package:get_it/get_it.dart';
import 'package:food_app_auto_router/core/network_service/api_client.dart';
import 'package:food_app_auto_router/data/data_source/product_data_source.dart';
import 'package:food_app_auto_router/data/repository_implementation/product_repository_implementation.dart';
import 'package:food_app_auto_router/domain/repository/product_repository.dart';
import 'package:food_app_auto_router/domain/usecase/product_usercase.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSource(apiClient: sl()),
  );


  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImplementation(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<GetProductItems>(
        () => GetProductItems(repo: sl()),
  );
}
