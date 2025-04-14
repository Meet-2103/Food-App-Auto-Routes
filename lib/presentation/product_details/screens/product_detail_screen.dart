import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/product_appbar.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/product_details_body.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: ProductDetailAppBar(),
      body: ProductDetailsBody(),
    );
  }
}
