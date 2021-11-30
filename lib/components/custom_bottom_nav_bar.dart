import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<Widget> pages;

  CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.pages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.widthMultiplier * 10.0),
            topRight: Radius.circular(SizeConfig.widthMultiplier * 10.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            elevation: 1.0,
            iconSize: SizeConfig.widthMultiplier * 6.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.house,
                ),
                label: 'HOME',
                activeIcon: CircleAvatar(
                  child: Icon(
                    CupertinoIcons.house_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'FAV',
                activeIcon: CircleAvatar(
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle),
                label: 'PROFILE',
                activeIcon: CircleAvatar(
                  child: Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                ),
              ),
            ],
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class BottomNavBar {
  String? title;
  Icon? icon;
  BottomNavBar({this.title, this.icon});
}
