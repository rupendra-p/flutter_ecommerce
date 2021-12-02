import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';

import '/models/Cart.dart';
import '/utils/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.widthMultiplier * 20,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(
                SizeConfig.heightMultiplier * 1,
              ),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: SizeConfig.widthMultiplier * 3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: primaryColor,
                    ),
                maxLines: 2,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: secondaryColor),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_circle,
                )),
            Text(
              '10',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: primaryColor,
                  ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
          ],
        ),
      ],
    );
  }
}
