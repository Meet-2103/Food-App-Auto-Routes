import 'package:get_it/get_it.dart';
import 'package:food_app_auto_router/core/network_service/api_client.dart';
import 'package:food_app_auto_router/data/data_source/product_data_source.dart';
import 'package:food_app_auto_router/data/repository_implementation/product_repository_implementation.dart';
import 'package:food_app_auto_router/domain/repository/product_repository.dart';
import 'package:food_app_auto_router/domain/usecase/product_usercase.dart';

final injector = GetIt.instance;

Future<void> init() async {

  injector.registerLazySingleton<ApiClient>(() => ApiClient());

  injector.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSource(apiClient: injector()),
  );

  injector.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImplementation(remoteDataSource: injector()),
  );

  injector.registerLazySingleton<GetProductItems>(
        () => GetProductItems(repo: injector()),
  );
}
