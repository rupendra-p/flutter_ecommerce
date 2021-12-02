import 'package:flutter/material.dart';
import '/components/product_card.dart';
import '../../models/product.dart';

import '/utils/size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
          ),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(
                width: SizeConfig.heightMultiplier * 2.5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
