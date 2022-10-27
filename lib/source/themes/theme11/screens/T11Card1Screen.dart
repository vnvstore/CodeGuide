import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../utils/AppWidget.dart';
import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/T11Strings.dart';

class T11Card1Screen extends StatefulWidget {

  @override
  T11Card1ScreenState createState() => T11Card1ScreenState();
}

class T11Card1ScreenState extends State<T11Card1Screen> {
  late List<Music> musicList;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    musicList = generateAlbumMusic();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      commonCacheImageWidget(t11_ic_cover_image, 200, width: context.width(), fit: BoxFit.cover),
                      Icon(AntDesign.play, size: 32, color: white),
                      Positioned(
                        top: 16,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.cancel_outlined, size: 24, color: white).onTap(() {
                              finish(context);
                            }),
                            Icon(Icons.favorite_border, size: 24, color: white),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Icon(Icons.settings_overscan, size: 24, color: white),
                      ),
                    ],
                  ),
                  16.height,
                  Text(
                    t11_lbl_singer_name + ' - ' + t11_lbl_album_name,
                    style: boldTextStyle(size: 20),
                  ),
                  8.height,
                  Text(
                    '1,354,589 Views',
                    style: secondaryTextStyle(),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      title: Text(t11_lbl_simple_text, style: primaryTextStyle(color: grey), textAlign: TextAlign.justify),
                      children: [
                        Text(t11_lbl_sample_long, style: primaryTextStyle(color: grey), textAlign: TextAlign.justify),
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 8),
                  ),
                  8.height,
                ],
              ),
              Column(
                children: musicList.map((data) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          commonCacheImageWidget(data.image, 150, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(AntDesign.play, size: 24, color: white),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(data.title, style: boldTextStyle(color: Colors.pink, size: 18)),
                                  Text(
                                    data.subtitle,
                                    style: boldTextStyle(color: white, size: 18),
                                  ),
                                  Text(
                                    '1,354,589 Views',
                                    style: secondaryTextStyle(color: white),
                                  ),
                                ],
                              )
                            ],
                          ).paddingAll(8)
                        ],
                      ),
                      8.height
                    ],
                  ).paddingOnly(right: 16,left: 16,bottom: 8);
                }).toList(),
              ),
              8.height,
            ],
          ),
        ),
      ),
    );
  }
}
