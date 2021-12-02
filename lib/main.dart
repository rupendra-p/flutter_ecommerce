import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '/screens/splash/splash_screen.dart';
import '/theme/theme_data.dart';
import '/utils/routes.dart';
import '/utils/size_config.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: dotenv.env['clientName']!,
          theme: lightTheme(context),
          // darkTheme: darkTheme(context),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        );
      });
    });
  }
}
