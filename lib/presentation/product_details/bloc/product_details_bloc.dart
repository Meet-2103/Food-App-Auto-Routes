import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';

import '../../../domain/usecase/product_usercase.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductItems getProductUseCase;
  ProductBloc(this.getProductUseCase) : super(InitialState()) {
    on<LoadingProduct>(_onLoadingProduct);
    on<AddCounter>(_addCounter);
    on<SubtractCounter>(_subCounter);
  }

  Future<void> _onLoadingProduct(LoadingProduct event, Emitter<ProductState> emit) async {
    try {
      final product = await getProductUseCase.getProductItemById(1); // Replace with actual ID
      print('🛒 Product loaded: ${product.title}');
      emit(LoadedProductState(counter: 0, data: product)); // emit proper state here
    } catch (e) {
      print('❌ Error loading product: $e');
      emit(InitialState());
    }
  }

  void _addCounter(AddCounter event, Emitter<ProductState> emit) {
    final currentState = state;
    if (currentState is LoadedProductState) {
      emit(LoadedProductState(counter: currentState.counter + 1, data: currentState.data));
    }
  }

  void _subCounter(SubtractCounter event, Emitter<ProductState> emit) {
    final currentState = state;
    if (currentState is LoadedProductState) {
      int currentCounter = currentState.counter > 0 ? currentState.counter - 1 : 0;
      emit(LoadedProductState(counter: currentCounter, data: currentState.data));
    }
  }

}
