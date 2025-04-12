import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';

import '../../../domain/usecase/product_usercase.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductItems getProductUseCase;
  ProductBloc(this.getProductUseCase) : super(InitalState()) {
    on<LoadingProduct>(_onLoadingProduct);
    on<LoadedProduct>(_onLoadedProduct);
    on<AddCounter>(_addCounter);
    on<SubtractCounter>(_subCounter);
  }

  Future<void> _onLoadingProduct(LoadingProduct event, Emitter<ProductState> emit) async {
    try {
      final product = await getProductUseCase.getProductItemById(1);  //use id from Ui
      emit(LoadingProductState(data: product));
    } catch (e) {
      emit(InitalState());
    }
  }


  void _onLoadedProduct(LoadedProduct event, Emitter<ProductState> emit) {
    emit(LoadedProductState(counter: 0));
  }

  void _addCounter(AddCounter event,Emitter<ProductState> emit){
    final currentState=state;
    if(currentState is LoadedProductState){
      emit(LoadedProductState(counter: currentState.counter+1));
    }
  }

  void _subCounter(SubtractCounter event,Emitter<ProductState> emit){
    final currentState=state;
    if(currentState is LoadedProductState){
      int currentCounter=currentState.counter>0 ? currentState.counter-1 : 0;
      emit(LoadedProductState(counter: currentCounter));
    }
  }
}
