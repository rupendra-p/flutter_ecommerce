import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';

import '/components/no_account_text.dart';
import '/components/socal_card.dart';
import '/utils/size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 8),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: primaryColor,
                      ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorGrey,
                      ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 8),
                const SignForm(),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.5,
                ),
                const NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
