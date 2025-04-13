

import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadingProduct extends ProductEvent{}


class AddCounter extends ProductEvent{}

class SubtractCounter extends ProductEvent{}