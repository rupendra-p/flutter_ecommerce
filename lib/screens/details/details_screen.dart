import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/screens/details/product_description.dart';
import 'package:ecommerce/screens/details/product_images.dart';
import 'package:ecommerce/screens/details/top_rounded_container.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'color_dots.dart';
import 'custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                  color: const Color(0xFFF6F7F9),
                  child: ColorDots(product: agrs.product),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5,
              vertical: SizeConfig.heightMultiplier,
            ),
            child: DefaultButton(
              press: () {},
              text: "Add to Cart",
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
