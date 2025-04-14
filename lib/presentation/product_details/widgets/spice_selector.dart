import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_event.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';

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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: ColorConstants.red,
                  inactiveTrackColor: ColorConstants.sliderGrey,
                  thumbColor: ColorConstants.red,
                  overlayColor: Colors.red.withOpacity(0.2),  //cannot be extracted
                  trackHeight: 7,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                ),
                child: Slider(
                  value: spiciness,
                  onChanged: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TextConstants.portion,
              style: TextStyleConstants.portion,
            ),
            const SizedBox(height: 4),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                int counter = 0;
                if (state is LoadedProductState) {
                  counter = state.counter;
                }

                return Row(
                  children: [
                    _roundedButton(
                      icon: Icons.remove,
                      onPressed: () {
                        context.read<ProductBloc>().add(SubtractCounter());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        counter.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    _roundedButton(
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

  Widget _roundedButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: ColorConstants.red,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
