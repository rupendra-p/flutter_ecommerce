import 'package:flutter/material.dart';

import '/utils/size_config.dart';
import '/widgets/product_card.dart';
import '../../models/product.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
          ),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier,
            ),
            child: Row(
              children: [
                ...List.generate(
                  demoProducts.length,
                  (index) {
                    if (demoProducts[index].isPopular) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.heightMultiplier,
                        ),
                        child: ProductCard(product: demoProducts[index]),
                      );
                    }
                    return const SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
