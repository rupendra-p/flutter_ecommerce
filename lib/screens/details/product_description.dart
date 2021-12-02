import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/models/Product.dart';
import '/utils/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
          ),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(
              SizeConfig.heightMultiplier * 2,
            ),
            width: SizeConfig.heightMultiplier * 8,
            decoration: BoxDecoration(
              color:
                  product.isFavourite ? const Color(0xFFFFE6E6) : const Color(0xFFF5F6F9),
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? const Color(0xFFFF4848) :const  Color(0xFFDBDEE4),
              height: SizeConfig.heightMultiplier * 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.heightMultiplier * 2.5,
            right: SizeConfig.heightMultiplier * 8,
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text("See More Detail",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: secondaryColor,
                        )),
                SizedBox(width: SizeConfig.widthMultiplier),
                const Icon(
                  Icons.chevron_right,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
