import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/counter_button.dart';

class SpicePortionSelector extends StatelessWidget {
  SpicePortionSelector({super.key});

  double spiciness = 0.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 20,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstants.spicy,
                style: TextStyleConstants.spicy,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: ColorConstants.red,
                  inactiveTrackColor: ColorConstants.sliderGrey,
                  thumbColor: ColorConstants.red,
                  overlayColor: ColorConstants.redAlpha,
                  trackHeight: 7,
                  thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10),
                ),
                child: Slider(
                  value: spiciness,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(TextConstants.mild, style: TextStyleConstants.mild),
                    Text(TextConstants.hot, style: TextStyleConstants.hot,)
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 16),

        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              TextConstants.portion,
              style: TextStyleConstants.portion,
            ),

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                int counter = 0;
                if (state is LoadedProductState) {
                  counter = state.counter;
                }

                return Row(
                  spacing: 12,
                  children: [
                    RoundedButton(
                      icon: Icons.remove,
                      onPressed: () {
                        context.read<ProductBloc>().add(SubtractCounter());
                      },
                    ),
                    Text(
                      counter.toString(),
                      style: TextStyleConstants.counter,
                    ),
                    RoundedButton(
                      icon: Icons.add,
                      onPressed: () {
                        context.read<ProductBloc>().add(AddCounter());
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        )
      ],
    );
  }
}