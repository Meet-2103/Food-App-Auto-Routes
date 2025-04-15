import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/navigation_routes/app_router.gr.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listiing_bloc.dart';
import 'package:food_app_auto_router/presentation/food_listing/bloc/food_listing_state.dart';

class TabContentGrid extends StatelessWidget {
  const TabContentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodListingBloc, FoodListingState>(
      builder: (context, state) {
        switch (state) {
          case InitialFoodListingState():
            return const Center(child: CircularProgressIndicator());

          case LoadedFoodListingState(:final products):
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.822,
                mainAxisSpacing: 31,
                crossAxisSpacing: 22,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(ProductDetailRoute(id: product.id));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConstants.boxShadowColor,
                          offset: const Offset(0, 6),
                          blurRadius: 17,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          product.image,
                          height: 120,
                          width: 120,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 120,
                              width: 120,
                              color: ColorConstants.errorColor,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                color: ColorConstants.grey,
                                size: 40,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(product.title, maxLines: 1),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  TextConstants.star,
                                  color: ColorConstants.starColor,
                                ),
                                const SizedBox(width: 4),
                                const Text(TextConstants.rating),
                              ],
                            ),
                            SvgPicture.asset(TextConstants.outlinedHeart),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

          default:
            return const Center(child: Text(TextConstants.errorFound));
        }
      },
    );
  }
}
