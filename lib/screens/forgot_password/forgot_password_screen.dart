import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * .5,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  // fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * .5,
              ),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    )
  
    );
  }
}
