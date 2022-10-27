import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import '../../utils/AppWidget.dart';
import '../utils/T11Widget.dart';

class T11ListingScreen extends StatefulWidget {
  static String tag = '/T11ListingScreen';

  @override
  T11ListingScreenState createState() => T11ListingScreenState();
}

class T11ListingScreenState extends State<T11ListingScreen> {
  double expandHeight = 350;
  late List<Music> musicList;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
    musicList = generateAlbumMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: white,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        commonCacheImageWidget(t11_ic_cover_image, 250, width: context.width(), fit: BoxFit.cover),
                        Container(
                          width: context.width(),
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: boxDecorationRoundedWithShadow(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Best of Boiler Music', style: boldTextStyle()),
                                  Text('1.5k listners', style: secondaryTextStyle()),
                                ],
                              ),
                              Text('Edward Steel', style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 120,
                      right: 30,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          commonCacheImageWidget(t11_ic_singer4, 60, width: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                          Positioned(
                            bottom: 4,
                            right: 40,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: boxDecorationWithShadow(boxShape: BoxShape.circle),
                              child: Icon(
                                Icons.cloud_circle,
                                size: 12,
                                color: grey,
                              ).paddingAll(4),
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
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  T11PlayPauseAnimation(),
                  16.height,
                  Column(
                    children: List.generate(musicList.length, (index) {
                      var num = index + 1;
                      return SettingItemWidget(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        leading: Row(
                          children: [
                            Text(
                              num.toString(),
                              style: primaryTextStyle(color: Colors.grey, size: 18),
                            ),
                            8.width,
                            commonCacheImageWidget(musicList[index].image, 45, width: 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                          ],
                        ),
                        title: musicList[index].title,
                        titleTextStyle: boldTextStyle(),
                        subTitle: musicList[index].subtitle,
                        subTitleTextStyle: secondaryTextStyle(),
                        trailing: Icon(Icons.more_vert_outlined, size: 24, color: Colors.grey),
                      );
                    }),
                  ),
                  16.height,
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
