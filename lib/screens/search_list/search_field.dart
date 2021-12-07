import 'dart:developer';

import '/constant/color_properties.dart';
import '/models/product.dart';
import '/providers/product_provider.dart';
import '/screens/details/details_screen.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Product>(
      optionsViewBuilder: (context, function, products) {
        return Scaffold(
            body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: products.length,
              separatorBuilder: (c, i) {
                return Divider(
                  height: 1,
                  color: colorGrey,
                  endIndent: SizeConfig.widthMultiplier * 9,
                );
              },
              itemBuilder: (c, i) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments:
                        ProductDetailsArguments(product: products.toList()[i]),
                  ),
                  title: Text(products.toList()[i].title),
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
          return const Iterable<Product>.empty();
        }
        return Provider.of<ProductProvider>(context, listen: false)
            .searchProducts(textEditingValue.text.trim());
      },
      onSelected: (Product selection) {
        log(selection.title);
        /* Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: selection),
        ); */
      },
    );
  }
}
