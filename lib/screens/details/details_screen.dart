import '/widgets/default_button.dart';
import '/constant/color_properties.dart';
import '/providers/cart_provider.dart';
import '/screens/details/product_description.dart';
import '/screens/details/product_images.dart';
import '/screens/details/top_rounded_container.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import 'color_dots.dart';
import 'custom_app_bar.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;

  incrementValueChanged() {
    setState(() {
      quantity++;
    });
  }

  decrementValueChanged() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return WillPopScope(
      onWillPop: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return Future.value(true);
      },
      child: Scaffold(
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
              color: colorWhite,
              child: Column(
                children: [
                  ProductDescription(
                    product: agrs.product,
                    pressOnSeeMore: () {},
                  ),
                  TopRoundedContainer(
                    color: const Color(0xFFF6F7F9),
                    child: ColorDots(
                      product: agrs.product,
                      quantity: quantity,
                      incrementChange: incrementValueChanged,
                      decrementChange: decrementValueChanged,
                    ),
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
                press: () {
                  Provider.of<CartProvider>(context, listen: false).addToCart(
                    agrs.product,
                    quantity,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Successfully added to the cart",
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        seconds: 3,
                      ),
                    ),
                  );
                },
                text: "Add to Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
