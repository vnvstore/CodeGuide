import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/AppWidget.dart';
import '../models/T9Models.dart';
import '../utils/T9BottomNavigationBar.dart';
import '../utils/T9Colors.dart';
import '../utils/T9Constant.dart';
import '../utils/T9DataGenerator.dart';
import '../utils/T9Images.dart';
import '../utils/T9Strings.dart';



class T9Dashboard extends StatefulWidget {
  static String tag = '/T9Dashboard';

  @override
  T9DashboardState createState() => T9DashboardState();
}

class T9DashboardState extends State<T9Dashboard> {
  late List<T9FeaturedModel> mList1;
  late List<T9CategoryModel> mList2;
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    mList1 = t9GetFavourites();
    mList2 = t9GetCategories();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.scaffoldBackgroundColor);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: shadowColorGlobal, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5),
          ],
          color: context.scaffoldBackgroundColor,
        ),
        child: T9BottomNavigationBar(
          backgroundColor: context.scaffoldBackgroundColor,
          items: <T9BottomNavigationBarItem>[
            T9BottomNavigationBarItem(icon: t9_ic_home_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_search_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_chart_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_message_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_more_navigation),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t9_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t9_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T9BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text(t9_lbl_featured, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
                      text(t9_lbl_see_all, textColor: t9_colorPrimary, textAllCaps: true, fontFamily: fontMedium)
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.62,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return T9Featured(mList1[index], index);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: text(
                    t9_lbl_categories,
                    textColor: appStore.textPrimaryColor,
                    fontFamily: fontBold,
                    fontSize: textSizeNormal,
                  ),
                ),
                SizedBox(height: 10),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList2.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return T9Category(mList2[index], index);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
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

// ignore: must_be_immutable
class T9Featured extends StatelessWidget {
  late T9FeaturedModel model;

  T9Featured(T9FeaturedModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, isLongText: true, maxLine: 2),
                text(model.price, textColor: appStore.textSecondaryColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class T9Category extends StatelessWidget {
  late T9CategoryModel model;

  T9Category(T9CategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, radius: 12, showShadow: true),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: model.img,
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: text(model.name, textColor: appStore.textPrimaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
