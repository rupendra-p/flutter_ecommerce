import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';

import '/constant/constants.dart';
import '/utils/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: SizeConfig.heightMultiplier * 4,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: SizeConfig.heightMultiplier * 25,
          width: SizeConfig.widthMultiplier * 50,
        ),
      ],
    );
  }
}
