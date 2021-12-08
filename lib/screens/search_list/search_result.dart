import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '/providers/product_provider.dart';
import '/screens/search_list/search_field.dart';
import '/screens/search_list/search_screen.dart';
import '/utils/size_config.dart';
import '/widgets/product_card.dart';

class SearchResultScreen extends StatelessWidget {
  static const routeName = "/searchResult";
  const SearchResultScreen(this.searchValue, {Key? key}) : super(key: key);

  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => SearchScreen(
              autoFocus: true,
              value: searchValue,
            ),
          ),
        );
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier,
                    horizontal: SizeConfig.heightMultiplier * 2,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor:
                            Theme.of(context).textTheme.headline6!.color,
                        // radius: SizeConfig.imageSizeMultiplier * 3,
                        child: IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => SearchScreen(
                                  autoFocus: true,
                                  value: searchValue,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2,
                      ),
                      Expanded(
                        child: SearchField(
                          value: searchValue,
                          autoFocus: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                getSearchProducts(
                  context,
                  searchValue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchProducts(BuildContext context, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
          child: Text(
            "Search results for $name",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Consumer<ProductProvider>(builder: (_, data, __) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.searchProducts(name).length,
            mainAxisSpacing: SizeConfig.heightMultiplier * 2,
            crossAxisSpacing: SizeConfig.heightMultiplier * 2,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier * 2,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                  product: data.searchProducts(name).toList()[index]);
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        }),
      ],
    );
  }
}
