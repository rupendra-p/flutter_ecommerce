import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/details/product_description.dart';
import 'package:ecommerce/screens/details/product_images.dart';
import 'package:ecommerce/screens/details/top_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'color_dots.dart';
import 'custom_app_bar.dart';


class DetailsScreen extends StatelessWidget {
  static const  String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: ListView(
      children: [
        ProductImages(product: agrs.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: agrs.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: agrs.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            // left: SizeConfig.screenWidth * 0.15,
                            // right: SizeConfig.screenWidth * 0.15,
                            // bottom: getProportionateScreenWidth(40),
                            // top: getProportionateScreenWidth(15),
                            ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
