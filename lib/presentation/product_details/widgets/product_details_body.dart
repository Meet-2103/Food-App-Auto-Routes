import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/widgets/spice_selector.dart';


class ProductDetailsBody extends StatelessWidget {
  final int id;
  const ProductDetailsBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc,ProductState>(
        builder: (context,state){
          if(state is InitialState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is LoadedProductState){
            final product=state.data;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                spacing: 19,
                children: [
                  ClipRRect(
                    child: Image.network(product.image,height: 350,width: 350,
                        errorBuilder:(context,error,stackTrace) {
                          return Container(
                            height: 350,
                            width: 350,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          );
                        }
                    ),
                  ),
                  Text(product.title,style: TextStyleConstants.productTitle,maxLines: 1,),
                  Row(
                    spacing: 5,
                    children: [
                        SvgPicture.asset(TextConstants.star,),
                        Text(TextConstants.ratingRow,style: TextStyleConstants.ratingRow,),
                    ],
                  ),
                  Text(product.description,style: TextStyleConstants.productDescription,maxLines: 4,),
                  SpicePortionSelector(),
                  Row(
                    spacing: 49,
                    children: [
                      Container(height: 70,width: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.red,
                      ),

                      child: Center(child: Text("\$${product.price}",style: TextStyleConstants.productPrice,)),),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: ColorConstants.orderNowButton,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text(TextConstants.orderNow,style: TextStyleConstants.orderNowButton,)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          else {
            return Center(child: Text(TextConstants.errorFound),);
          }
    });
  }
}
