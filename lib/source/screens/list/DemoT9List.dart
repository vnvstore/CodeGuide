import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T9Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T9Colors.dart';
import '../utils/T9Constant.dart';
import '../utils/T9DataGenerator.dart';
import '../utils/T9Strings.dart';


class DemoT9List extends StatefulWidget {
  static String tag = '/DemoT9List';

  @override
  DemoT9ListState createState() => DemoT9ListState();
}

class DemoT9ListState extends State<DemoT9List> {
  late List<T9PeopleModel> mList1;
  late List<T9BadgeModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = t9GetPending();
    mList2 = t9GetBadges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: context.scaffoldBackgroundColor,
                child: SafeArea(
                  child: Container(
                    color: context.scaffoldBackgroundColor,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 16),
                        text(t9_lbl_achievements, textColor: appStore.textPrimaryColor, fontSize: textSizeLarge, fontFamily: fontBold),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          color: context.scaffoldBackgroundColor,
                          child: TabBar(
                            labelPadding: EdgeInsets.only(left: 0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: t9_colorPrimary,
                            labelColor: t9_colorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: t9_textColorSecondary,
                            tabs: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  t9_lbl_badges,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  t9_lbl_leader_board,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9Badges(mList2[index], index);
                    }),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return T9LeaderBoard(mList1[index], index);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class T9Badges extends StatelessWidget {
  late T9BadgeModel model;

  T9Badges(T9BadgeModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    if (model.isLocked == false) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        color: context.scaffoldBackgroundColor,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration: BoxDecoration(shape: BoxShape.circle, color: model.color),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => placeholderWidget(),
                  imageUrl: model.img,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                  SizedBox(width: 4),
                  text(model.comment, textColor: appStore.textSecondaryColor,maxLine: 1),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        color: context.scaffoldBackgroundColor,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration: BoxDecoration(shape: BoxShape.circle, color: t9_met_grey),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.lock, color: t9_white),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(t9_lbl_locked_badge, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                SizedBox(width: 4),
                text(t9_lbl_unlock_to_see_details, textColor: t9_textColorSecondary),
              ],
            )
          ],
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class T9LeaderBoard extends StatelessWidget {
  late T9PeopleModel model;

  T9LeaderBoard(T9PeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      color: context.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: MediaQuery.of(context).size.width * 0.08,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  SizedBox(width: 4),
                  text(model.points, textColor: appStore.textSecondaryColor),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.appBarColor),
            child: Center(child: text((i + 1).toString())),
          )
        ],
      ),
    );
  }
}
