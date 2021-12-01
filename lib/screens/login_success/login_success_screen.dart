import 'package:flutter/material.dart';

import '/components/default_button.dart';
import '/screens/home/home_screen.dart';
import '/utils/size_config.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.heightMultiplier * 40, //40%
          ),
          SizedBox(height: SizeConfig.heightMultiplier),
          const Text(
            "Login Success",
            style: TextStyle(
              // fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.widthMultiplier * 50,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
