import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/product_appbar.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/product_details_body.dart';
import 'package:food_app_auto_router/core/di/injection_container.dart' as di;

import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final int id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(         //remove
      create: (context) => ProductBloc(di.sl())..add(LoadingProduct()),

    child: Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: ProductDetailAppBar(),
      body: ProductDetailsBody(id: id,),
    ),
      );
  }
}
