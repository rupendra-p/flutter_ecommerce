import 'package:ecommerce/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class NavigationScreen extends StatefulWidget{
   static const  String routeName = "/home";
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
   
    return CustomBottomNavBar(
      currentIndex: index,
      onTap: (i) => setState(() => index = i),
      pages: [
       const HomeScreen(),
        Container(),
        const ProfileScreen(),
      ],
    );
  }
}