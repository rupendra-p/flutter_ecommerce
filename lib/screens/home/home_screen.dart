import '/screens/home/popular_product.dart';
import '/screens/home/special_offers.dart';
import '/screens/home/staggerred_gridview_product.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 1,
          ),
          const HomeHeader(),
          SizedBox(
            height: SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DiscountBanner(),
                    const Categories(),
                    const SpecialOffers(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.5,
                    ),
                    const PopularProducts(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.5,
                    ),
                    const StaggeredGridListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
