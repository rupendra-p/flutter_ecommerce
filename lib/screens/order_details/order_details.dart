import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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

const PADDING = 16.0;
const RADIUS = 16.0;
const MAIN_TEXT = 16.0;

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
      color: Colors.orange.withOpacity(0.1),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'ORDER DETAIL',
              style: TextStyle(
                fontSize: MAIN_TEXT + 8.0,
                color: colorWhite,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(RADIUS * 2),
                bottomLeft: Radius.circular(RADIUS * 2),
              ),
            ),
            centerTitle: true,
            //expandedHeight: PADDING * 5,
            backgroundColor: secondaryColor,
            floating: true,
            snap: true,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: colorWhite,
                )),
            pinned: true,
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: true,
            child: Padding(
              padding: const EdgeInsets.all(PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(RADIUS),
                    child: Padding(
                      padding: const EdgeInsets.all(PADDING / 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: secondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(RADIUS / 2),
                            child: Padding(
                              padding: const EdgeInsets.all(PADDING / 2),
                              child: Icon(
                                CupertinoIcons.gift_alt,
                                color: colorGrey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'JUL 25, 2020',
                                  style: TextStyle(
                                    fontSize: MAIN_TEXT,
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: PADDING / 4,
                                ),
                                Text(
                                  '#e23123343',
                                  style: TextStyle(
                                    color: colorGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  Material(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(RADIUS),
                    child: Padding(
                      padding: const EdgeInsets.all(PADDING / 2),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: PADDING - 4,
                                width: PADDING - 4,
                                decoration: BoxDecoration(
                                  color: colorBlack,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(height: 4),
                              /* CustomPaint(
                                size: Size(
                                  1,
                                  PADDING * 1.5,
                                ),
                                painter: DashedLineVerticalPainter(),
                              ), */
                              SizedBox(height: 4),
                              Container(
                                height: PADDING - 4,
                                width: PADDING - 4,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: PADDING,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kathmandu Bagamti Nepal',
                                  style: TextStyle(
                                    fontSize: MAIN_TEXT,
                                    color: colorBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: PADDING * 1.5,
                                ),
                                Text(
                                  'New Delhi Inida',
                                  style: TextStyle(
                                    fontSize: MAIN_TEXT,
                                    color: secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  /* Material(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(RADIUS),
                    child: TimeLine(process: _process),
                  ), */
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  Material(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(RADIUS),
                    child: Padding(
                      padding: const EdgeInsets.all(PADDING / 2),
                      child: Table(
                        textDirection: TextDirection.ltr,
                        children: [
                          TableRow(children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                            Text(
                              "Rs.1000",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              "Service Charge",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                            Text(
                              "Rs.800",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                            Text(
                              "Rs.1800",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                              ),
                              textScaleFactor: 1.1,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  Material(
                    color: colorWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(PADDING / 2),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          maintainState: true,
                          title: Text(
                            'Pashupatinath Mandir',
                            style: TextStyle(
                              fontSize: MAIN_TEXT,
                              color: colorBlack,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          children: [
                            ListTile(
                              tileColor: secondaryColor.withOpacity(0.05),
                              dense: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(RADIUS)),
                              title: Text(
                                'Coconut',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'x2',
                                style: TextStyle(
                                  color: secondaryColor,
                                ),
                              ),
                              leading: Material(
                                color: secondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(RADIUS / 2),
                                child: Padding(
                                  padding: const EdgeInsets.all(PADDING / 2),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(RADIUS / 2),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://ak.picdn.net/shutterstock/videos/1016168053/thumb/1.jpg',
                                      height: PADDING * 2,
                                      width: PADDING * 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: PADDING / 2,
                            ),
                            ListTile(
                              tileColor: secondaryColor.withOpacity(0.05),
                              dense: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(RADIUS)),
                              title: Text(
                                'Coconut',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                'x2',
                                style: TextStyle(
                                  color: secondaryColor,
                                ),
                              ),
                              leading: Material(
                                color: secondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(RADIUS / 2),
                                child: Padding(
                                  padding: const EdgeInsets.all(PADDING / 2),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(RADIUS / 2),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://ak.picdn.net/shutterstock/videos/1016168053/thumb/1.jpg',
                                      height: PADDING * 2,
                                      width: PADDING * 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  final _process = [
    'Order Created',
    'Delivery Processing',
    'Confirm Delivery Man',
  ];
}
