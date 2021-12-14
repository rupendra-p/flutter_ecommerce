import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/screens/order_details/order_details.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String date;
  final String address;

  final String price;
  final String title;
  final String orderId;
  final Color? backGround;

  const OrderCard({
    Key? key,
    required this.date,
    required this.title,
    required this.address,
    required this.price,
    required this.orderId,
    this.backGround,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      child: Material(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier,
                      ),
                      Text(
                        "Purchased on: $date",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: colorLightGrey,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    'RS. $price',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: secondaryColor,
                          size: SizeConfig.imageSizeMultiplier * 5,
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier,
                        ),
                        Text(
                          address,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier,
                  ),
                  Container(
                    height: 4.5 * SizeConfig.heightMultiplier,
                    width: 4.5 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        SizeConfig.heightMultiplier * 2,
                      ),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: secondaryColor,
                          size: SizeConfig.imageSizeMultiplier * 4.5,
                        ),
                        onPressed: () => navigate(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetail()));
  }
}
