import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/T6Models.dart';
import '../utils/AppWidget.dart';
import '../utils/T6DataGenerator.dart';
import '../utils/T6Widget.dart';
import '../utils/widgets/T6SliderWidget.dart';


class DemoT6ImageSlider extends StatefulWidget {
  static String tag = '/DemoT6ImageSlider';

  @override
  DemoT6ImageSliderState createState() => DemoT6ImageSliderState();
}

class DemoT6ImageSliderState extends State<DemoT6ImageSlider> {
  int selectedPos = 1;
  List<T6Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(titleName: "Image Slider"),
            SizedBox(height: 16),
            T6SliderWidget(mSliderList),
          ],
        ),
      ),
    );
  }
}
