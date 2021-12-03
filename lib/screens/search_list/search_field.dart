import 'dart:developer';

import '/constant/color_properties.dart';
import 'package:flutter/material.dart';

import '/utils/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => log(value),
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2.5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.imageSizeMultiplier * 3,
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.imageSizeMultiplier * 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.imageSizeMultiplier * 3,
            ),
            borderSide: BorderSide.none,
          ),
          fillColor: primaryColor.withOpacity(0.05),
          filled: true,
          isDense: true,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search)),
    );
  }
}
