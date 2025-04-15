import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/spice_selector.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/success_box.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state) {
          case InitialState():
            return const Center(child: CircularProgressIndicator());

          case LoadedProductState(:final data):
            final product = data;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network(
                      product.image,
                      height: 350,
                      width: 350,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 350,
                          width: 350,
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
                  ),
                  const SizedBox(height: 19),
                  Text(
                    product.title,
                    style: TextStyleConstants.productTitle,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      SvgPicture.asset(TextConstants.star),
                      const SizedBox(width: 5),
                      Text(
                        TextConstants.ratingRow,
                        style: TextStyleConstants.ratingRow,
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  Text(
                    product.description,
                    style: TextStyleConstants.productDescription,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 19),
                  SpicePortionSelector(),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.red,
                        ),
                        child: Center(
                          child: Text(
                            "\$${product.price}",
                            style: TextStyleConstants.productPrice,
                          ),
                        ),
                      ),
                      const SizedBox(width: 49),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => const SuccessDialog(),           //use auto routes
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.orderNowButton,
                            minimumSize: const Size.fromHeight(70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0, // Match your container's flat look
                          ),
                          child: Text(
                            TextConstants.orderNow,
                            style: TextStyleConstants.orderNowButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                ],
              ),
            );

          default:
            return const Center(child: Text(TextConstants.errorFound));
        }
      },
    );
  }
}
