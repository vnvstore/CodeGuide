import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppWidget.dart';
import '../model/T11Model.dart';
import '../utils/T11DataGenerator.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';


import 'package:codeguide/main/utils/AppColors.dart';

class T11SearchScreen extends StatefulWidget {
  static String tag = '/T11SearchScreen';

  @override
  T11SearchScreenState createState() => T11SearchScreenState();
}

class T11SearchScreenState extends State<T11SearchScreen> {
  List<Music> musicList = generateAlbumMusic();

  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.appBarColor!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  64.height,
                  Text(t11_lbl_search_result, style: boldTextStyle(color: appColorPrimary, size: 18)),
                  32.height,
                  Stack(
                    children: [
                      commonCacheImageWidget(t11_ic_singer2, 180, width: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Icon(Icons.favorite_border, color: white, size: 18),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 54,
                              child: Stack(
                                children: [
                                  commonCacheImageWidget(t11_ic_singer1, 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(50).paddingSymmetric(horizontal: 16),
                                  Positioned(right: 0, child: commonCacheImageWidget(t11_ic_singer3, 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(12)),
                                  Positioned(left: 0, child: commonCacheImageWidget(t11_ic_singer4, 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(12)),
                                ],
                              ),
                            ),
                            4.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(t11_lbl_singer_name + ' ' + t11_lbl_singer_name, style: boldTextStyle(size: 12, color: Colors.white)),
                                Text(t11_lbl_album_name, style: boldTextStyle(size: 12, color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  42.height,
                  musicAlbumList(musicList),
                  16.height,
                  musicAlbumList(musicList),
                  16.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(t11_lbl_accompanied_by, style: boldTextStyle(color: Colors.grey)),
                  ).paddingLeft(16),
                  16.height,
                  musicAlbumList(musicList),
                  16.height,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: searchWidget(Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
