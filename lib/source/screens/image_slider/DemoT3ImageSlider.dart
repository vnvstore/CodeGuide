import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T3_Model.dart';
import '../utils/AppWidget.dart';
import '../utils/T3DataGenerator.dart';
import '../utils/T3Dashboard.dart';


class DemoT3ImageSlider extends StatefulWidget {
  static var tag = "/DemoT3ImageSlider";

  @override
  DemoT3ImageSliderState createState() => DemoT3ImageSliderState();
}

class DemoT3ImageSliderState extends State<DemoT3ImageSlider> {
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
