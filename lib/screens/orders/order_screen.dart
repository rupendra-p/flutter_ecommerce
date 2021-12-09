import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/scroll_configuration.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.5 * SizeConfig.heightMultiplier,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorDark,
                      foregroundColor:
                          Theme.of(context).textTheme.headline6!.color,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Text(
                      'My Orders',
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                TabBar(
                  labelColor: Theme.of(context).textTheme.bodyText1!.color,
                  indicatorColor: secondaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: SizeConfig.textMultiplier * 0.4,
                  onTap: (index) {},
                  tabs: const [
                    Tab(
                      icon: Text(
                        'Pending',
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Completed',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: const TabBarView(
                      children: [
                        Center(
                            child: Text(
                          "0",
                          style: TextStyle(fontSize: 40),
                        )),
                        Center(
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
