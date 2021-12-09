
import '/screens/profile/edit_profile_screen.dart';
import 'package:ecommerce/screens/notifications/notification_screen.dart';
import 'package:ecommerce/screens/search_list/search_result.dart';


import '/screens/navigation_screen.dart';
import '/screens/search_list/search_screen.dart';
import 'package:flutter/widgets.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/complete_profile/complete_profile_screen.dart';
import '/screens/details/details_screen.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/login_success/login_success_screen.dart';
import '/screens/otp/otp_screen.dart';
import '/screens/sign_in/sign_in_screen.dart';
import '/screens/splash/splash_screen.dart';
import '/screens/search_list/search_result.dart';
import '/screens/setting/setting_screen.dart';

import '/screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NavigationScreen.routeName: (context) => NavigationScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  SearchResultScreen.routeName: (context) => SearchResultScreen(""),

  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  NotificationScreen.routeName:(context)=>NotificationScreen(),

};
