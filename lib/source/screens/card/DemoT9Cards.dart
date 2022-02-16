import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T9Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T9Colors.dart';
import '../utils/T9Constant.dart';
import '../utils/T9DataGenerator.dart';
import '../utils/T9Images.dart';
import '../utils/T9Strings.dart';


class DemoT9Cards extends StatefulWidget {
  static String tag = '/DemoT9Cards';

  @override
  _DemoT9CardsState createState() => _DemoT9CardsState();
}

class _DemoT9CardsState extends State<DemoT9Cards> {
  late List<T9FeaturedModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = t9GetFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final topView = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: text(t9_lbl_favourites, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  placeholder: (context, url) => placeholderWidget(),
                  imageUrl: t9_ic_fab_back, width: 40, height: 40),
              Icon(Icons.search, color: t9_colorPrimary),
            ],
          ),
        ),
      ],
    );

    final cardList = ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mListings1.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, bgColor: context.scaffoldBackgroundColor, radius: 10.0),
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: CachedNetworkImage(
                        placeholder: (context, url) => placeholderWidget(),
                        imageUrl: mListings1[index].img, height: 50, width: 50, fit: BoxFit.fill),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(
                                    mListings1[index].name,
                                    fontFamily: fontBold,
                                    textColor: appStore.textPrimaryColor,
                                  ),
                                  SizedBox(height: 4),
                                  text(mListings1[index].type, textColor: appStore.textSecondaryColor),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(
                                  "20",
                                  fontFamily: fontBold,
                                  textColor: appStore.textSecondaryColor,
                                ),
                                SizedBox(height: 4),
                                text("Students", textColor: appStore.textSecondaryColor),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(
                                    "51",
                                    fontFamily: fontBold,
                                    textColor: appStore.textSecondaryColor,
                                  ),
                                  SizedBox(height: 4),
                                  text("Lectures", textColor: appStore.textSecondaryColor),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: text(mListings1[index].price, textColor: t9_white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });

    return SafeArea(
      child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: t9_colorPrimary),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    topView,
                    cardList,
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
