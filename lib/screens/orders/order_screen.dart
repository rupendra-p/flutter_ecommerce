import '/constant/color_properties.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier,
                      ),
                      child: TabBarView(
                        children: [
                          pendingOrders(context),
                          completedOrders(context),
                        ],
                      ),
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

  Widget pendingOrders(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => orderCard(context),
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(
        height: SizeConfig.heightMultiplier * .5,
      ),
    );
  }

  Widget completedOrders(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => orderCard(context),
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(
        height: SizeConfig.heightMultiplier * .5,
      ),
    );
  }

  Widget orderCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.heightMultiplier * 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.heightMultiplier * 2,
          vertical: SizeConfig.heightMultiplier,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("Order ID: 12345")),
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
            const Text(
              "Package ID: #4566",
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Items: 3"),
                Text("Amount: \$300"),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Date: 2073/12/11"),
                Container(
                  height: 4.5 * SizeConfig.heightMultiplier,
                  width: 4.5 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.heightMultiplier * 2,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: SizeConfig.imageSizeMultiplier * 4.5,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
