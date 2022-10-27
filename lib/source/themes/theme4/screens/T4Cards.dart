import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppWidget.dart';
import '../utils/T4Colors.dart';
import '../utils/T4Images.dart';
import '../utils/T4Widgets.dart';
import '../models/T4Models.dart';
import '../utils/T4Constant.dart';
import '../utils/T4DataGenerator.dart';
import '../utils/T4Strings.dart';


class T4Cards extends StatefulWidget {
  static var tag = "/T4Cards";

  @override
  T4CardsState createState() => T4CardsState();
}

class T4CardsState extends State<T4Cards> {
  int selectedPos = 1;
  late List<T4NewsModel> mCardss;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mCardss = getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    changeStatusColor(appStore.appBarColor!);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        child: Column(
          children: <Widget>[
            TopBar(t4_lbl_cards),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mCardss.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          child: Stack(
                            children: <Widget>[
                              CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                imageUrl: mCardss[index].image,
                                width: width - 32,
                                height: width * 0.5,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: t4_colorPrimary,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(shape: BoxShape.circle, color: t4_white),
                              )
                            ],
                            alignment: Alignment.center,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mCardss[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontBold),
                                  text(mCardss[index].info, fontSize: textSizeMedium, textColor: appStore.textPrimaryColor),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(t4_heart, width: 22, height: 22, color: appStore.iconColor),
                                SizedBox(width: 16),
                                SvgPicture.asset(t4_share, width: 22, height: 22, color: appStore.iconSecondaryColor),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
