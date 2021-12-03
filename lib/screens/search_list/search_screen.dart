import '/constant/color_properties.dart';
import '/screens/search_list/search_field.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = "/search";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.heightMultiplier * 2.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: colorWhite,
                    foregroundColor: primaryColor,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 5,
                  ),
                  const Expanded(child: SearchField()),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }
}
