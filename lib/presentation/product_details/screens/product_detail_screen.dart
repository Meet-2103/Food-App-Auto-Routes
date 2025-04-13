import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';

import '../widgets/product_appbar.dart';
import '../widgets/product_details_body.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailAppBar(),
      body: ProductDetailsBody(),
    );
  }
}
