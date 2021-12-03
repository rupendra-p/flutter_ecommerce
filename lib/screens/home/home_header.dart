import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart_provider.dart';
import '/screens/cart/cart_screen.dart';
import '/utils/size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.heightMultiplier * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SearchField(),
          const Spacer(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: data.cart.length,
            isShow: true,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 2,
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            press: () {},
            numOfitem: 1,
          ),
        ],
      ),
    );
  }
}
