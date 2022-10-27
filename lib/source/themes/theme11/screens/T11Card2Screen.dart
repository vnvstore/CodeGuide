import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppWidget.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';

class T11Card2Screen extends StatefulWidget {

  @override
  T11Card2ScreenState createState() => T11Card2ScreenState();
}

class T11Card2ScreenState extends State<T11Card2Screen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor!, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            commonCacheImageWidget(
              t11_ic_bottom_sheet,
              context.height(),
              width: context.width(),
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text(t11_lbl_new_release, style: boldTextStyle(size: 18, color: white)),
                Text(t11_lbl_album_name1, style: boldTextStyle(size: 28, color: white)),
                Text('by ' + t11_lbl_singer_name1, style: boldTextStyle(color: white)),
              ],
            ).paddingAll(16)
          ],
        ).paddingAll(16),
        bottomNavigationBar: T11PlayPauseAnimation(),
      ),
    );
  }
}
