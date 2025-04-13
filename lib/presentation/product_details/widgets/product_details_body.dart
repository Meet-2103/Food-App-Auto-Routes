import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:food_app_auto_router/presentation/product_details/bloc/product_details_state.dart';
import 'package:food_app_auto_router/core/text_constants.dart';


class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc,ProductState>(
        builder: (context,state){

          if(state is InitialState){
            return CircularProgressIndicator();
          }
          else if(state is LoadedProductState){
            final product=state.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network(product.image,height: 350,width: 350,),
                  ),
                  SizedBox(height: 50,),
                  Text(product.title,style: TextStyleConstants.productTitle,maxLines: 1,),
                  SizedBox(height: 9,),
                  Row(
                    children: [
                        Icon(Icons.star),
                        Text(TextConstants.ratingRow,style: TextStyleConstants.ratingRow,),
                    ],
                  ),
                  Text(product.description,style: TextStyleConstants.productDescription,maxLines: 4,),
                  SizedBox(height: 29,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
              
                    ],
                  ),
                  SizedBox(height: 73,),
                  Row(
                    children: [
                      Container(height: 70,width: 104,
                      color: ColorConstants.red,
                      child: Text("${product.price}",style: TextStyleConstants.productPrice,),),
                      Container(
                        height: 70,
                        width: 239,
                        child: Text(TextConstants.orderNow),
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
