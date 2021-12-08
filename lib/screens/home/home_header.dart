import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart_provider.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/search_list/search_screen.dart';
import '/utils/size_config.dart';
import 'icon_btn_with_counter.dart';

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
          const Text('TOKOTO'),
          const Spacer(),
          IconBtnWithCounter(
            icon: const Icon(
              Icons.search,
            ),
            press: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            numOfitem: data.gettotalCartItems(),
            isShow: true,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            icon: const Icon(Icons.notifications_outlined),
            press: () {},
            numOfitem: 1,
          ),
        ],
      ),
    );
  }
}
