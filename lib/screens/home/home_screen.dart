import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '/constant/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static const  String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      currentIndex: index,
      onTap: (i) => setState(() => index = i),
      pages: [
        Body(),
        Container(),
      
        ProfileScreen(),
      ],
    );
  }
}
