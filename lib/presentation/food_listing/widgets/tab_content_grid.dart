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
  final String label;
  const TabContentGrid({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodListingBloc,FoodListingState>(
      builder: (context,state){
        if(state is InitialFoodListingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is LoadedFoodListingState){
          var product=state.products;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.822,
              mainAxisSpacing: 31,
              crossAxisSpacing: 22,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(ProductDetailRoute(id: product[index].id));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:  ColorConstants.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x21000000),
                        offset: const Offset(0, 6),
                        blurRadius: 17,
                        spreadRadius: 0,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Image.network(product[index].image,height: 120,width: 120,
                        errorBuilder:(context,error,stackTrace) {
                        return Container(
                          height: 120,
                          width: 120,
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 40,
              ),
              );
                      }),
                          SizedBox(height: 10,),
                          Text(product[index].title,maxLines: 1,),
                          SizedBox(height: 20,),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          SvgPicture.asset(TextConstants.star,color: ColorConstants.starColor,),
                          Text(TextConstants.rating),
                          SvgPicture.asset(TextConstants.heartIcon,color: ColorConstants.red
                        ,),

                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        else{
          return Center(child: Text(TextConstants.errorFound),);
        }
      }
    );

  }
}
