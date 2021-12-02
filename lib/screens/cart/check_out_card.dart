import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/widgets/default_button.dart';
import '/utils/size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2 * SizeConfig.heightMultiplier,
        horizontal: 4 * SizeConfig.heightMultiplier,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(4 * SizeConfig.heightMultiplier),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                  height: 5 * SizeConfig.heightMultiplier,
                  width: 5 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                Text("Add voucher code",
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(width: SizeConfig.widthMultiplier),
                const Icon(
                  Icons.chevron_right_outlined,
                )
              ],
            ),
            SizedBox(
              height: 2.5 * SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: primaryColor,
                        ),
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: secondaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25 * SizeConfig.heightMultiplier,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
