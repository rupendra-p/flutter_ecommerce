import 'package:ecommerce/providers/theme_provider.dart';
import 'package:ecommerce/utils/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/providers/cart_provider.dart';
import '/providers/product_provider.dart';
import '/providers/wishlist_provider.dart';
import '/screens/splash/splash_screen.dart';
import '/theme/theme_data.dart';
import '/utils/routes.dart';
import '/utils/size_config.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  ThemeService.sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final controller = Provider.of<ThemeProvider>(context);
              SizeConfig().init(constraints, orientation);
              return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return MaterialApp(
                      themeMode: //
                          // ThemeMode.dark,
                          controller.themeMode,
                      debugShowCheckedModeBanner: false,
                      title: dotenv.env['clientName']!,
                      theme: lightTheme(context),
                      darkTheme: darkTheme(context),
                      // home: NavigationScreen(),
                      initialRoute: SplashScreen.routeName,
                      routes: routes,
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
