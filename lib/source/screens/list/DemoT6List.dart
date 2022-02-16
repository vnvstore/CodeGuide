import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T6Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T6Colors.dart';
import '../utils/T6Constant.dart';
import '../utils/T6DataGenerator.dart';
import '../utils/T6Strings.dart';
import '../utils/T6Widget.dart';

class DemoT6List extends StatefulWidget {
  static String tag = '/DemoT6List';

  @override
  DemoT6ListState createState() => DemoT6ListState();
}

class DemoT6ListState extends State<DemoT6List> {
  int selectedPos = 1;
  late List<T6LogModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          TopBar(titleName: t6_lbl_listing),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mListings.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        width: width,
                        decoration: boxDecoration(radius: 16, showShadow: true, bgColor: context.scaffoldBackgroundColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.topRight,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => placeholderWidget(),
                                      imageUrl: mListings[index].Image,
                                      height: 200,
                                      width: width,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: boxDecoration(radius: 10, showShadow: false, bgColor: t6white),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: text(mListings[index].type),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mListings[index].name, textColor: appStore.textPrimaryColor, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                                  text(
                                    mListings[index].type,
                                    textColor: appStore.textSecondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
