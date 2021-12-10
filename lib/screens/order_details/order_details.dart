import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName = '/orderDetailsScreen';

  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2 * SizeConfig.heightMultiplier,
              vertical: 1 * SizeConfig.heightMultiplier),
          child: Column(
            children: [
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
                    'Your Order Details',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                ],
              ),
              const OrderDetailBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailBody extends StatefulWidget {
  const OrderDetailBody({Key? key}) : super(key: key);

  @override
  _OrderDetailBodyState createState() => _OrderDetailBodyState();
}

class _OrderDetailBodyState extends State<OrderDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 3,
            color: Theme.of(context).cardTheme.color,
            child: Padding(
              padding: EdgeInsets.all(
                SizeConfig.heightMultiplier,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  orderDetails(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Text(
                    "Your Ordered 3 Products",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const OrderProductsCard();
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderDetails() {
    return Column(
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
        const Text("Date: 2073/12/11"),
      ],
    );
  }
}

class OrderProductsCard extends StatelessWidget {
  const OrderProductsCard({Key? key}) : super(key: key);

  displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Card(
        elevation: 0,
        child: Container(
          color: Theme.of(context).cardTheme.color,
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.widthMultiplier * 20,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.heightMultiplier * 2),
                    ),
                    // child: Hero(
                    //   tag: const ValueKey(),
                    child: Image.asset(
                      "assets/images/ps4_console_white_1.png",
                    ),
                    // ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wireless Controller",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier),
                  Row(
                    children: const [
                      Text(
                        '\$100',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: secondaryColor),
                      ),
                      Text(
                        ' x 3',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // CartPriceQuantity(cart),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("\$ 123",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: secondaryColor,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
