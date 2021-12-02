import 'package:ecommerce/utils/scroll_configuration.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.heightMultiplier * 4,
                  ),
                  child: Text(
                    "Profile",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    // textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                const Center(child: ProfilePic()),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                ProfileMenu(
                  text: "My Account",
                  icon: Icons.person_outline,
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: Icons.notifications_outlined,
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: Icons.settings_outlined,
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: Icons.help_outline,
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: Icons.logout_outlined,
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.heightMultiplier * 2.5,
        vertical: SizeConfig.heightMultiplier * 1.3,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colorWhite,
          padding: EdgeInsets.all(
            SizeConfig.heightMultiplier * 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.heightMultiplier * 2,
            ),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: SizeConfig.imageSizeMultiplier * 7,
            ),
            SizedBox(width: SizeConfig.heightMultiplier * 2.5),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: primaryColor,
                    ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
              size: SizeConfig.imageSizeMultiplier * 5,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: colorWhite),
                  ),
                  primary: Colors.white,
                  backgroundColor: colorWhite,
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
