import 'package:flutter/material.dart';
import '/components/default_button.dart';
import '/screens/home/home_screen.dart';
import '/utils/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.heightMultiplier),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.heightMultiplier, //40%
        ),
        SizedBox(height: SizeConfig.heightMultiplier),
        Text(
          "Login Success",
          style: TextStyle(
            // fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.widthMultiplier,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
