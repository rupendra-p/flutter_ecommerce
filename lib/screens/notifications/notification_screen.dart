import '/constant/color_properties.dart';
import '/screens/notifications/notification_tile.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notifications";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Notifications',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (c, i) {
                      return SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                        child: const Divider(
                          height: 1,
                          color: colorGrey,
                        ),
                      );
                    },
                    itemCount: 20,
                    itemBuilder: (c, i) {
                      return const NotificationTile(
                        imageUrl:
                            "https://i.pinimg.com/originals/03/11/62/0311622466bc4c9406c411cc8417888d.jpg",
                        subTitle:
                            "Free Product Banner Vectors, 25,000+ Images in AI, EPS format",
                        title: "Product 01",
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
