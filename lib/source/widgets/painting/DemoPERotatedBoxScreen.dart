import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoPERotatedBoxScreen extends StatefulWidget {
  static String tag = '/DemoPERotatedBoxScreen';

  @override
  DemoPERotatedBoxScreenState createState() => DemoPERotatedBoxScreenState();
}

class DemoPERotatedBoxScreenState extends State<DemoPERotatedBoxScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text('Without Rotation', style: boldTextStyle()).paddingBottom(20),
            RotatedBox(
              quarterTurns: 4,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(10),
            Text('Rotated at 90° right angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 3,
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
            Text('Rotated at 180° angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 2,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
            Text('Rotated at 90° left  angle', style: boldTextStyle()).paddingTop(20),
            RotatedBox(
              quarterTurns: 1,
              child: CachedNetworkImage(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: 'https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg',
              ).cornerRadiusWithClipRRect(10),
            ).paddingTop(20),
          ],
        ),
      ),
    );
  }
  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}