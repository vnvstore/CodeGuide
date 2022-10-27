import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppWidget.dart';
import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';



class T11DashboardScreen extends StatefulWidget {
  static String tag = '/T11DashboardScreen';

  @override
  T11DashboardScreenState createState() => T11DashboardScreenState();
}

class T11DashboardScreenState extends State<T11DashboardScreen> {
  List<Music> musicList = generateAlbumMusic();
  double expandHeight = 380;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: expandHeight),
            pinned: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t11_lbl_recently_listen, style: boldTextStyle()),
                        Text(t11_lbl_more, style: secondaryTextStyle(size: 16)),
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 16),
                    musicAlbumList(musicList),
                    16.height,
                    Text(
                      t11_lbl_recommendation,
                      style: boldTextStyle(),
                    ).paddingLeft(16),
                    16.height,
                    HorizontalList(
                      padding: EdgeInsets.only(left: 16),
                      spacing: 8,
                      wrapAlignment: WrapAlignment.spaceBetween,
                      itemCount: musicList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.asset((musicList[index].image), height: 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                                Icon(Icons.favorite_border, color: white).paddingAll(8)
                              ],
                            ),
                            8.height,
                            Text(musicList[index].title, style: boldTextStyle()),
                          ],
                        );
                      },
                    ),
                  ],
                ).paddingSymmetric(vertical: 16),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationWidget(),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSliverAppBarDelegate({required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 120;
    final top = expandedHeight - shrinkOffset - size / 0.6;
    final width = context.width();

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset, width),
        Positioned(
          top: top,
          left: 16,
          right: 16,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) {
    return Opacity(
      opacity: appear(shrinkOffset),
      child: AppBar(
        title: Text('title'),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
    );
  }

  Widget buildBackground(double shrinkOffset, double width) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: Stack(
        children: [
          commonCacheImageWidget(t11_ic_singer1, 360, width: width, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.only(bottom: 16, top: 32),
            alignment: Alignment.topCenter,
            height: 360,
            decoration: boxDecorationWithRoundedCorners(borderRadius: radius(0), backgroundColor: appColorPrimary.withOpacity(0.6)),
            child: searchWidget(Colors.white).paddingSymmetric(horizontal: 16),
          ),
        ],
      ),
    );
  }

  Widget buildFloating(double shrinkOffset) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t11_lbl_next_song, style: secondaryTextStyle(size: 20, color: white)),
              Text('Mic Drop', style: boldTextStyle(size: 50, color: white)),
              Text('BTS', style: boldTextStyle(size: 32, color: white)),
            ],
          ),
          8.height,
          Container(
            //height: 80,
            // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: boxDecorationWithShadow(borderRadius: radius(12), backgroundColor: white, offset: Offset(0, 5)),
            child: Row(
              children: [
                commonCacheImageWidget(
                  t11_ic_singer1,
                  80,
                  width: 80,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRectOnly(topLeft: 12, bottomLeft: 12),
                8.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BTS', style: boldTextStyle()),
                    4.height,
                    Text('Mic Drop', style: secondaryTextStyle()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
