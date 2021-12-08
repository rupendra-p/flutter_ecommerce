import 'package:ecommerce/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '/screens/sign_in/sign_in_screen.dart';
import '/utils/scroll_configuration.dart';

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
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                const Center(child: ProfilePic()),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
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
                  press: () {
                    final controller =
                        Provider.of<ThemeProvider>(context, listen: false);

                    controller.updateThemeMode(
                        controller.themeMode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light);
                  },
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: Icons.help_outline,
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: Icons.logout_outlined,
                  press: () {
                    Navigator.of(context).pushNamed(
                      SignInScreen.routeName,
                    );
                  },
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
        vertical: SizeConfig.heightMultiplier * .8,
      ),
      child: ListTile(
        tileColor: colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.heightMultiplier * 2,
          ),
        ),
        onTap: press,
        leading: Icon(
          icon,
          color: primaryColor,
          size: SizeConfig.imageSizeMultiplier * 7,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: primaryColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
          size: SizeConfig.imageSizeMultiplier * 5,
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
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 15,
          width: SizeConfig.heightMultiplier * 15,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: secondaryColor,
                child: Icon(
                  Icons.person,
                  size: SizeConfig.imageSizeMultiplier * 20,
                  color: canvasColor,
                ),
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
                        borderRadius: BorderRadius.circular(
                          SizeConfig.heightMultiplier * 6,
                        ),
                        side: const BorderSide(color: colorWhite),
                      ),
                      primary: colorWhite,
                      backgroundColor: colorWhite,
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.add_a_photo,
                      color: primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        Text(
          "Sameer Baniya",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          "baniyanischal@gmail.com",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
