import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoPEBackdropFilterScreen extends StatefulWidget {
  static String tag = '/DemoPEBackdropFilterScreen';

  @override
  DemoPEBackdropFilterScreenState createState() => DemoPEBackdropFilterScreenState();
}

class DemoPEBackdropFilterScreenState extends State<DemoPEBackdropFilterScreen> {
  double xAxis = 3.0;
  double yAxis = 0.0;

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
        body: Responsive(
          mobile: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis), child: Container(color: Colors.white.withOpacity(0.2))),
                ).paddingOnly(top: 25, bottom: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('X Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: xAxis,
                          onChanged: (val) {
                            setState(() {
                              xAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${xAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Y Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: yAxis,
                          onChanged: (val) {
                            setState(() {
                              yAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${yAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          tablet: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis), child: Container(color: Colors.white.withOpacity(0.2))),
                ).paddingOnly(top: 25, bottom: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('X Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: xAxis,
                          onChanged: (val) {
                            setState(() {
                              xAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${xAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Y Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: yAxis,
                          onChanged: (val) {
                            setState(() {
                              yAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${yAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          web: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                  height: context.height() * 0.5,
                  width: context.width() * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1514565131-fce0801e5785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis), child: Container(color: Colors.white.withOpacity(0.2))),
                ).paddingOnly(top: 25, bottom: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('X Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: xAxis,
                          onChanged: (val) {
                            setState(() {
                              xAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${xAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Y Axis: ', style: boldTextStyle()),
                        Slider(
                          inactiveColor: appStore.textPrimaryColor,
                          activeColor: appStore.appColorPrimary,
                          max: 10,
                          min: 0,
                          value: yAxis,
                          onChanged: (val) {
                            setState(() {
                              yAxis = val;
                            });
                          },
                        ).expand(),
                        Text('Value: ${yAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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