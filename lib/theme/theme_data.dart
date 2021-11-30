import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    // scaffoldBackgroundColor: secondaryColor.withOpacity(
    //   0.5,
    // ),
    canvasColor: canvasColor,
    // secondaryColor.withOpacity(
    //   0.5,
    // ),
    appBarTheme: const AppBarTheme(color: primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        //fixedSize: Size.fromHeight(SizeConfig.heightMultiplier*5),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      backgroundColor: colorWhite,
      unselectedItemColor: colorLightGrey,
      showSelectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).focusColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}
