import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: CircleAvatar(
        radius: SizeConfig.imageSizeMultiplier * 7,
        backgroundColor: colorWhite,
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
