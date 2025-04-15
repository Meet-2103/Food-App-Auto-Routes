

import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadingProduct extends ProductEvent{
  final int id;
  LoadingProduct({required this.id});

  @override
  List<Object?> get props => [id];
}


class AddCounter extends ProductEvent{}

class SubtractCounter extends ProductEvent{}