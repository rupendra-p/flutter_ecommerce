import 'package:flutter/material.dart';

import '/screens/search_list/search_field.dart';
import '/utils/size_config.dart';

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
              child: const Expanded(child: SearchField()),
            ),
          ],
        ),
      ),
    );
  }
}
