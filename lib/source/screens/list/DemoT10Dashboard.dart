import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T10Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T10Constant.dart';
import '../utils/T10DataGenerator.dart';
import '../utils/T10SliderWidget.dart';
import '../utils/T10Strings.dart';
import '../utils/T10Widget.dart';

class DemoT10Dashboard extends StatefulWidget {
  static String tag = '/DemoT10Dashboard';

  @override
  DemoT10DashboardState createState() => DemoT10DashboardState();
}

class DemoT10DashboardState extends State<DemoT10Dashboard> {
  var currentIndexPage = 0;
  late List<T10Images> mSliderList;
  late List<T10Product> mDashboardList;

  @override
  void initState() {
    super.initState();
    mSliderList = getDashboard();
    mDashboardList = getDashboardProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_dashboard),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: spacing_standard_new),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: T10CarouselSlider(
                        viewportFraction: 0.9,
                        height: MediaQuery.of(context).size.height,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        items: mSliderList.map((slider) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => placeholderWidget(),
                                  imageUrl: slider.img,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height* 0.9,
                                ),
                              );
                            },
                          );
                        }).toList(),
                        onPageChanged: (index) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: spacing_large),
                    Container(
                      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                      color: context.scaffoldBackgroundColor,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mDashboardList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => placeholderWidget(),
                                  imageUrl: mDashboardList[index].img,
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              text(mDashboardList[index].name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                              Row(
                                children: <Widget>[
                                  text(
                                    mDashboardList[index].price,
                                    textColor: appStore.textSecondaryColor,
                                  ),
                                  SizedBox(
                                    width: spacing_control,
                                  ),
                                  text(mDashboardList[index].subPrice, textColor: appStore.textSecondaryColor, lineThrough: true)
                                ],
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
