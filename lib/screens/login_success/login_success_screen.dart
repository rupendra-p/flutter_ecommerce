import 'package:flutter/material.dart';

import '/screens/navigation_screen.dart';
import '/utils/size_config.dart';
import '/widgets/default_button.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            Image.asset(
              "assets/images/success.png",
              height: SizeConfig.heightMultiplier * 40, //40%
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Text(
              "Login Success",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 10,
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 50,
              child: DefaultButton(
                text: "Back to home",
                press: () {
                  Navigator.pushReplacementNamed(
                      context, NavigationScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
