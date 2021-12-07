import 'dart:developer';

import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, function, string) {
        return Scaffold(
            body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: string.length,
              separatorBuilder: (c, i) {
                return Divider(
                  height: 1,
                  color: colorGrey,
                  endIndent: SizeConfig.widthMultiplier * 9,
                );
              },
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(string.toList()[i]),
                );
              }),
        ));
      },
      fieldViewBuilder: (context, controller, focusNode, function) {
        return TextField(
          controller: controller,
          autofocus: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.imageSizeMultiplier * 6,
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.imageSizeMultiplier * 6,
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.imageSizeMultiplier * 6,
              ),
              borderSide: BorderSide.none,
            ),
            fillColor: primaryColor.withOpacity(0.05),
            filled: true,
            isDense: true,
            hintText: "Search product",
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: colorWhite,
                  foregroundColor: primaryColor,
                  radius: SizeConfig.imageSizeMultiplier * 6,
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 2,
                ),
              ],
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        log('You just selected $selection');
      },
    );
  }
}
