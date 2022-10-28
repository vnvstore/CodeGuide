import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppWidget.dart';
import '../model/T3_Model.dart';
import '../utils/T3DataGenerator.dart';
import '../utils/T3Images.dart';
import 'T3Dashboard.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';


class T3ImageSlider extends StatefulWidget {
  static var tag = "/T3ImageSlider";

  @override
  T3ImageSliderState createState() => T3ImageSliderState();
}

class T3ImageSliderState extends State<T3ImageSlider> {
  late List<T3DashboardSliderModel> mSliderListings;

  @override
  void initState() {
    super.initState();
    mSliderListings = getDashboardSlider();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      appBar: appBar(context, t3_slider_title),
      body: Observer(
        builder: (_) => SafeArea(
          child: Container(
            color: context.scaffoldBackgroundColor,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  height: 195,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mSliderListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return T3DashboardSlider(mSliderListings[index], index);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
