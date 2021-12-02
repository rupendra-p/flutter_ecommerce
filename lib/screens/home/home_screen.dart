
import 'package:ecommerce/screens/home/popular_product.dart';
import 'package:ecommerce/screens/home/special_offers.dart';

import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
class HomeScreen extends StatefulWidget {
  static const  String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            HomeHeader(),
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            PopularProducts(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
          ],
        ),
      ),
    );
  }
}

